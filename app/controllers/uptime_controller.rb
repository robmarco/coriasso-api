class UptimeController < ApplicationController

  def index
    render json: { message: "Welcome to Coriasso's API! Move your body!" }, status: :ok
  end

end
