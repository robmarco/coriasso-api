class Api::BaseController < ActionController::Base
  protect_from_forgery with: :null_session

  # Callbacks
  before_action :authenticate_with_api_key

  # Includes
  include ExceptionRescuable
  include BasicAuthenticable
  include ApiTokenAuthenticable

  # Public methods
  def append_info_to_payload(payload)
    super
    payload[:host] = request.host
		payload[:ip] 	 = request.ip
  end

end
