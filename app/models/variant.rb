# == Schema Information
#
# Table name: variants
#
#  id         :integer          not null, primary key
#  size       :string
#  price      :integer          default(0)
#  status     :integer          default("enable")
#  beer_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Variant < ApplicationRecord
  # Attributes
  enum status: [:enable, :disable]

  # Associations
  belongs_to :beer

  # Validations
  validates :size, :price, :status, presence: true
  validates :beer, presence: true
end
