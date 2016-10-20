class Api::BaseController < ActionController::Base
  protect_from_forgery with: :null_session

  # Callbacks
	before_action :set_request_default_content_type

  # Exceptions
	rescue_from(ActionController::ParameterMissing) do |parameter_missing_exception|
	    error = {}
	    error[parameter_missing_exception.param] = 'parameter is required'
	    response = { errors: [error] }
	    render json: response, status: :unprocessable_entity
	end

	rescue_from(ActionController::UnpermittedParameters) do |parameter_missing_exception|
		error = {}
		parameter_missing_exception.params.each do |param|
			error[param] = 'parameter is not permitted'
		end
		response = { errors: error }
		render json: response, status: :unprocessable_entity
	end

	rescue_from ActionController::RoutingError, :with => :route_not_found
	rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  def append_info_to_payload(payload)
    super
    payload[:host] = request.host
		payload[:ip] 	 = request.ip
  end

  private

		def json_request?
			request.format.json?
		end

		def set_request_default_content_type
			request.format = :json
		end

    def route_not_found
			render json: { errors: 'Route not found. Check our documentation and try it again.' }, status: :not_found
		end

		def record_not_found
			render json: { errors: 'Resource not found. You are trying to get access to an invalid resource or a resource that doesnt belong to you.' }, status: :not_found
		end

		def render_unauthorized
      self.headers['Authorization'] = 'Token token="Custom"'
      render json: { errors: 'You shall not pass! Request an API Key to Coriasso.'}, status: 401
    end

    # def render_not_active
    #   render json: { errors: 'Your provider account in not active yet. Ask to our team about your Corriaso Provider Account.' }, status: 403
    # end

    # def authenticate_provider!
		# 	@current_provider = provider_authenticate_with_token
    #
		# 	return render_unauthorized if @current_provider.nil?
    #   return render_not_active   if @current_provider.inactive? && !@current_provider.has_virtual_number?
		# end
    #
		# def provider_authenticate_with_token
    #   api_key    = request.headers['x-api-key']
    #   auth_token = ApiKey.includes(:provider).find_by(token: api_key)
    #   auth_token.provider if !auth_token.nil?
		# end

end
