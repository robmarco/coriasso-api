module ExceptionRescuable
  extend ActiveSupport::Concern

  included do
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
  	rescue_from ActionController::RoutingError,  :with => :route_not_found
  	rescue_from ActiveRecord::RecordNotFound,    :with => :record_not_found
  end

  private

		def json_request?
			request.format.json?
		end

		def set_request_default_content_type
			request.format = :json
		end

		def record_not_found
			render json: { errors: 'Route not found. Check our documentation and try it again.' }, status: :not_found
		end

		def route_not_found
			render json: { errors: 'Resource not found. You are trying to get access to an invalid resource or a resource that doesnt belong to you.' }, status: :not_found
		end

end
