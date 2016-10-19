class RoutingController < ApplicationController

  def index
    render json: { errors: "Route not found. Check our documentation and try it again." },
           status:  :not_found
  end

end
