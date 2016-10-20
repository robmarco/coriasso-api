# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  name               :string
#  username           :string
#  email              :string
#  salt               :string
#  encrypted_password :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class User < ApplicationRecord
  # Callbacks
	before_save 	:encrypt_password
	after_save 		:clear_password

  # Attributes
	attr_accessor :password

	# Associations
	has_many :ratings, dependent: :destroy

  # Validations
  validates :email, :name, presence: true
  validates :username, presence: true
  validates :password, presence: true, on: :create
  validates :password, length: { minimum: 6 }, on: :create
  validates_format_of :username, with: /\A[a-zA-Z]+([0-9]*[\_\.]*[a-zA-Z]*[0-9]*)*\z/
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create
  validates_uniqueness_of :username, :email, case_sensitive: false

  def self.by_email(email)
		self.find_by(email: email)
	end

  def self.authenticate(email="", login_password="")
		user = self.by_email(email)
		return user if user && user.match_password(login_password)
    false
	end

  def match_password(login_password="")
		encrypted_password == BCrypt::Engine.hash_secret(login_password, salt)
	end

  private

  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.encrypted_password = BCrypt::Engine.hash_secret(password, salt)
    end
  end

  def clear_password
    self.password = nil
  end

end
