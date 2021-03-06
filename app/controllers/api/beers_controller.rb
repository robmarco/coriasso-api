class Api::BeersController < Api::BaseController
  before_action :authenticate_user!, only: [:rate, :like, :dislike]
  before_action :set_beer, only: [:show, :rate, :like, :dislike]

  def index
    @beers = BeersFinder.query.page(params[:page])
  end

  def this_week
    @beers = BeersFinder.query(this_week: true).page(params[:page])
  end

  def featured
    @beers = BeersFinder.query(featured: true).page(params[:page])
  end

  def show
  end

  def rate
    result = Beers::RateBeer.call(beer: @beer, user: @current_user, rate: rate_params)
    if result.success?
      head :no_content
    else
      render json: { errors: result.errors }, status: :unprocessable_entity
    end
  end

  def like
    if @current_user.like_beer(@beer)
      head :no_content
    else
      render json: { errors: "Error trying to add this beer to your favorites" }, status: :unprocessable_entity
    end
  end

  def dislike
    if @current_user.dislike_beer(@beer)
      head :no_content
    else
      render json: { errors: "Error trying to remove this beer from your favorites" }, status: :unprocessable_entity
    end
  end

  private

    def set_beer
      @beer = Beer.includes(:style, :variants).find(params[:id])
    end

    def rate_params
      params.permit(:rate)
    end

end
