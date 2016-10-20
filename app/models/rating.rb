# == Schema Information
#
# Table name: ratings
#
#  id         :integer          not null, primary key
#  beer_id    :integer
#  user_id    :integer
#  rate       :integer
#  comment    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Rating < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :beer

  # Validations
  validates :rate, :comment, presence: true
  validates :beer, :user, presence: true
end
