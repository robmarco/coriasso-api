class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  protect_from_forgery prepend: true # For devise

  # Exceptions
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  def append_info_to_payload(payload)
    super
    payload[:host] = request.host
		payload[:ip] 	 = request.ip
  end

  private

  def record_not_found
    redirect_to({ action: :index }, alert: "Lo sentimos, pero no encontramos el elemento que buscas. ¡Inténtalo más tarde!")
  end
end
