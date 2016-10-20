class Api::StylesController < Api::BaseController
  before_action :set_style, only: [:show, :beers]

  def index
    @styles = Style.all.page(params[:page])
  end

  def show
  end

  def beers
    @beers = @style.beers.page(params[:page])
  end

  private

    def set_style
      @style = Style.find(params[:id])
    end

end
