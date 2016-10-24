module ApiTokenAuthenticable
  private

  def authenticate_with_api_key
    api_key    = request.headers['x-api-key']
    auth_token = ApiKey.find_by(token: api_key)
    render_api_unauthorized if auth_token.nil?
	end

  def render_api_unauthorized
    self.headers['x-api-key'] = 'your-api-key'
    render json: { errors: 'You shall not pass! There is a problem with your api key.'}, status: 401
  end
end
