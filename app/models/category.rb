# == Schema Information
#
# Table name: categories
#
#  id                 :integer          not null, primary key
#  name               :string
#  description        :text
#  status             :integer          default("active")
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#
# Indexes
#
#  index_categories_on_status  (status)
#

class Category < ApplicationRecord
  # Attributes
  attr_accessor :image_url
  enum status: [:active, :inactive]

  # Associations
  has_and_belongs_to_many :beers

  # Attachments
  has_attached_file :image, styles: {
		square: '250x250#',
		medium: '500x500>'
	}

  # Validations
  validates :name, presence: true
  validates :image, presence: true, on: :create
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  # Public methods
  def image_url=(url)
		self.image = URI.parse(url)
		@image_url = url
	rescue OpenURI::HTTPError => ex
    self.errors.add(:image, "error trying to download the image")
	end
end
