class Beers::RateBeer
  include ActiveModel::Validations

  # Attributes
  attr_reader :user, :beer, :rate

  validates :user, :beer, :rate, presence: true

  def self.call(*args)
    new(*args).call
  end

  def initialize(params={})
    @user    = params.fetch(:user, nil)
    @beer    = params.fetch(:beer, nil)
    @rate    = params.fetch(:rate, nil)
  end

  def call
    return Error.new(errors: self.errors.full_messages) if !self.valid?

    ActiveRecord::Base.transaction do
      rate_beer||rollback
      # TODO: update_beer_global_rating||rollback
      return Success.new
    end

    Error.new(errors: "Error rating a beer")
  end

  private

    def rollback
      raise ActiveRecord::Rollback
    end

    def rate_beer
      @user.rate_beer(@beer, @rate)
    end

end
