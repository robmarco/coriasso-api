# == Schema Information
#
# Table name: styles
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Style < ApplicationRecord
  # Associations
  has_many :beers, dependent: :destroy
  
  # Validations
  validates :name, :description, presence: true
end
