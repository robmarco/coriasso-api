class Api::CategoriesController < Api::BaseController
  before_action :set_category, only: [:show, :beers]

  def index
    @categories = Category.active.page(params[:page])
  end

  def show
  end

  def beers
    @beers = @category.beers.includes(:style).page(params[:page])
  end

  private

    def set_category
      @category = Category.active.find(params[:id])
    end
end
