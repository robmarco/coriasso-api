# == Schema Information
#
# Table name: beers
#
#  id          :integer          not null, primary key
#  name        :string
#  origin      :string
#  abv         :float
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  style_id    :integer
#

class Beer < ApplicationRecord
  # Associations
  has_many :variants, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_and_belongs_to_many :categories
  belongs_to :style

  # Validations
  validates :name, :origin, :abv, :description, presence: true
  validates :style, presence: true
end
