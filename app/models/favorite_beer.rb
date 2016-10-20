# == Schema Information
#
# Table name: favorite_beers
#
#  id         :integer          not null, primary key
#  beer_id    :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class FavoriteBeer < ApplicationRecord
  # Associations
  belongs_to :beer, counter_cache: :like_count
  belongs_to :user

  # Validations
  validates :beer, :user, presence: true
  validates_uniqueness_of :beer, scope: :user, message: "has already been added to my favorites"
end
