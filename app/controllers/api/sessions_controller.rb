class Api::SessionsController < Api::BaseController
  before_action :logout_user!, only: [:logout]

  def login
    login = Auth::LoginUser.new(login_params)
    result = login.call

    if result.success?
      @user, @token = login.user, login.token
    else
      render json: result.errors, status: :unauthorized
    end
  end

  def register
    @user = User.new(register_params.except(:device, :push_token))

    register = Auth::RegisterUser.new(
      user: @user,
      push_token: register_params[:push_token],
      device: register_params[:device]
    )
    result = register.call

    if result.success?
      @user, @token = register.user, register.token
    else
      render json: result.errors, status: :unprocessable_entity
    end
  end

  def logout
    head :no_content, status: :ok
  end

  private

    def login_params
      params.permit(:email, :password, :device, :push_token)
    end

    def register_params
      params.require(:user).permit(:email, :password, :name, :push_token, :device)
    end

end
