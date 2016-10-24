# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           not null
#  salt                   :string
#  encrypted_password     :string           not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  last_sign_in_at        :datetime
#  name                   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  image_file_name        :string
#  image_content_type     :string
#  image_file_size        :integer
#  image_updated_at       :datetime
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
	# Includes
	include Authenticable

	# Attributes
  attr_accessor :image_url

	# Scopes
  scope :not_me, -> (me) { where('id != ?', me.id) }

	# Associations
	has_many :user_tokens, dependent: :destroy
	has_many :ratings, dependent: :destroy

	has_many :favorite_beers, dependent: :destroy
	has_many :beers, through: :favorite_beers

	# Attachments
  has_attached_file :image, styles: {
		square: '250x250#',
		medium: '500x500>'
	}

  # Validations
  validates :email, :name, presence: true
  validates :password, presence: true, on: :create
	validates :image, presence: true, on: :create
  validates :password, length: { minimum: 6 }, on: :create
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create
  validates_uniqueness_of :email, case_sensitive: false
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

	# Public methods
	def generate_token(push_token, device)
		self.user_tokens.create! push_token: push_token, device: device
	end

	def rate_beer(beer, rate)
		rating = self.ratings.new(beer: beer, rate: rate)
		rating.save
	end

	def like_beer(beer)
		favorite_beer = self.favorite_beers.new(beer: beer)
		favorite_beer.save
	end

	def dislike_beer(beer)
		favorite_beer = self.favorite_beers.find_by(id: beer.id)
		favorite_beer ? favorite_beer.destroy : false
	end

	def image_url=(url)
		self.image = URI.parse(url)
		@image_url = url
	rescue OpenURI::HTTPError => ex
    self.errors.add(:image, "error trying to download the image")
	end

end
