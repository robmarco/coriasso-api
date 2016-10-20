require 'active_support/concern'

module Authenticable
  extend ActiveSupport::Concern

  included do
    # attribues
    attr_accessor :password
    # callbacks
    before_save :encrypt_password
    after_save  :clear_password
  end

  # Class Methods --------------------------
  class_methods do
    def by_email(email)
      self.find_by(email: email)
    end

    def authenticate(email="", login_password="")
      user = self.by_email(email)
      if user && user.match_password(login_password)
        return user
      else
        return false
      end
    end
  end

  # Instance Methods -----------------------
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
