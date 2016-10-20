module BasicAuthenticable

  private

    def authenticate_user!
      user = user_authenticate_with_token
      @current_user = user
      render_unauthorized if @current_user.nil?
    end

    def logout_user!
      user_token = logout_with_token
      user_token ? user_token.destroy : render_unauthorized
    end

    def user_authenticate_with_token
      authenticate_with_http_token do |token, options|
        auth_token = UserToken.find_by(token: token)
        auth_token.user if !auth_token.nil?
      end
    end

    def logout_with_token
      authenticate_with_http_token do |token, options|
        auth_token = UserToken.find_by(token: token)
      end
    end

    def render_unauthorized
      self.headers['Authorization'] = 'Token token="your-user-token"'
      render json: { errors: 'You shall not pass! There is a problem with your token.'}, status: 401
    end
end
