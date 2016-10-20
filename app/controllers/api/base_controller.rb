class Api::BaseController < ActionController::Base
  protect_from_forgery with: :null_session

  # Includes
  include ExceptionRescuable
  include BasicAuthenticable

  # Public methods
  def append_info_to_payload(payload)
    super
    payload[:host] = request.host
		payload[:ip] 	 = request.ip
  end

end
