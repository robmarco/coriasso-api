class Auth::LoginUser
  include ActiveModel::Validations

  # Attributes
  attr_reader(
    :email,
    :password,
    :device,
    :push_token,
    :user,
    :token
  )

  # Validations
  validates :email, :password, :device, presence: true
  validates :device, inclusion: { in: %w(ios android web),
                     message: "%{value} is not a valid device" }

  def initialize(params={})
    @email      = params.fetch(:email, nil)
    @password   = params.fetch(:password, nil)
    @device     = params.fetch(:device, nil)
    @push_token = params.fetch(:push_token, nil)
  end

  def call
    return Error.new(errors: self.errors.full_messages) if !self.valid?

    @user = User.authenticate(@email, @password)

    if @user
      generate_authentication_token(@push_token, @device)
      update_user_auth_info
      Success.new
    else
      Error.new(errors: "Invalid email or password")
    end
  end

  private

    def generate_authentication_token(pushtoken="", device="")
      @token = @user.generate_token(pushtoken, device)
    end

    def update_user_auth_info
      last_sign_in_at = @token.created_at
      sign_in_count   = @user.sign_in_count + 1
      @user.update(last_sign_in_at: last_sign_in_at, sign_in_count: sign_in_count)
    end
end
