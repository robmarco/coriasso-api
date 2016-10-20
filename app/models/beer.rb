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
#  like_count  :integer          default(0)
#

class Beer < ApplicationRecord
  # Associations
  belongs_to :style
  has_and_belongs_to_many :categories
  has_many :variants, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :favorite_beers, dependent: :destroy
  has_many :users, through: :favorite_beers

  # Validations
  validates :name, :origin, :abv, :description, presence: true
  validates :style, presence: true
end
