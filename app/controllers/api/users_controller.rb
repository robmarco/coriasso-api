class Api::UsersController < Api::BaseController
  before_action :set_user, only: [:index]

  def index
    @users = User.all
  end

  def show
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

end
