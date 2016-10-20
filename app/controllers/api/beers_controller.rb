class Api::BeersController < Api::BaseController
  before_action :set_beer, only: [:show, :rate, :unrate]

  def index
    @beers = Beer.all.page(params[:page])
  end

  def show
  end

  # def rate
  # end
  #
  # def unrate
  # end

  private

    def set_beer
      @beer = Beer.find(params[:id])
    end

end
