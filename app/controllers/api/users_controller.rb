class Api::UsersController < Api::BaseController
  before_action :authenticate_user!, only: [:me]
  before_action :set_user, only: [:show, :ratings, :favorited]

  def index
    @users = User.all.page(params[:page])
  end

  def show
  end

  def me
    @user = @current_user
  end

  def ratings
    @ratings = @user.ratings
                    .includes(:beers)
                    .page(params[:page])
  end

  def favorited
    @beers = @user.beers.page(params[:page])
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

end
