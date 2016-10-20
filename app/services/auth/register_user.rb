class Auth::RegisterUser
  include ActiveModel::Validations

  # Attributes
  attr_reader(
    :user,
    :token,
    :push_token,
    :device
  )

  # Validations
  validates :user, :device, presence: true
  validates :device, inclusion: { in: %w(ios android web),
                     message: "%{value} is not a valid device" }

  def initialize(params={})
    @user       = params.fetch(:user, User.new)
    @push_token = params.fetch(:push_token, nil)
    @device     = params.fetch(:device, nil)
  end

  def call
    return Error.new(errors: @user.errors)  if !@user.valid?
    return Error.new(errors: self.errors)   if !self.valid?

    if @user.save
      generate_authentication_token(@push_token, @device)
      update_user_auth_info
      Success.new
    else
      Error.new(errors: @user.errors)
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
