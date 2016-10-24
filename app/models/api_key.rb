# == Schema Information
#
# Table name: api_keys
#
#  id         :integer          not null, primary key
#  token      :string
#  label      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_api_keys_on_token  (token) UNIQUE
#

class ApiKey < ApplicationRecord
  # Callbacks
  before_create :generate_token

  # Validations
  validates :label, presence: true

  private

    def generate_token
      if self.token.nil?
        begin
          self.token = SecureRandom.hex
        end while self.class.exists?(token: token)
      end
    end
end
