# == Schema Information
#
# Table name: categories
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  status      :integer          default("active")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_categories_on_status  (status)
#

class Category < ApplicationRecord
  # Attributes
  enum status: [:active, :inactive]

  # Associations
  has_and_belongs_to_many :beers

  # Validations
  validates :name, presence: true
end
