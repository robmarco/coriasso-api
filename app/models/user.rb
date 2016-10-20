# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           not null
#  salt                   :string
#  encrypted_password     :string           not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  last_sign_in_at        :datetime
#  name                   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
	# Includes
	include Authenticable

	# Scopes
  scope :not_me, -> (me) { where('id != ?', me.id) }

	# Associations
	has_many :user_tokens, dependent: :destroy
	has_many :ratings, dependent: :destroy

  # Validations
  validates :email, :name, presence: true
  validates :password, presence: true, on: :create
  validates :password, length: { minimum: 6 }, on: :create
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create
  validates_uniqueness_of :email, case_sensitive: false

	# Public methods
	def generate_token(push_token, device)
		self.user_tokens.create! push_token: push_token, device: device
	end

end
