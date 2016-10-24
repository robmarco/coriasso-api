# == Schema Information
#
# Table name: beers
#
#  id                 :integer          not null, primary key
#  name               :string
#  origin             :string
#  abv                :float
#  description        :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  style_id           :integer
#  like_count         :integer          default(0)
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class Beer < ApplicationRecord
  # Attributes
  attr_accessor :image_url

  # Associations
  belongs_to :style
  has_and_belongs_to_many :categories
  has_many :variants, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :favorite_beers, dependent: :destroy
  has_many :users, through: :favorite_beers

  # Attachments
  has_attached_file :image, styles: {
		square: '250x250#',
		medium: '500x500>'
	}

  # Validations
  validates :name, :origin, :abv, :description, presence: true
  validates :style, presence: true
  validates :image, presence: true, on: :create

  # Public methods
  def image_url=(url)
		self.image = URI.parse(url)
		@image_url = url
	rescue OpenURI::HTTPError => ex
    self.errors.add(:image, "error trying to download the image")
	end
end
