# == Schema Information
#
# Table name: ratings
#
#  id         :integer          not null, primary key
#  beer_id    :integer
#  user_id    :integer
#  rate       :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Rating < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :beer

  # Validations
  validates :rate, presence: true
  validates :beer, :user, presence: true
  validates_inclusion_of :rate, in: [1..5], message: "should be a value from 1 to 5"
  validates_uniqueness_of :beer, scope: :user
end
