class SessionsController < Devise::SessionsController
  prepend_before_filter :require_no_authentication, only: [:create]
  include Devise::Controllers::Helpers

  respond_to :json

  def create
    resource = User.find_for_database_authentication(email: params[:email])
    return invalid_login_attempt unless resource

    if resource.valid_password?(params[:password])
      sign_in(:user, resource)
      resource.ensure_authentication_token!
      render :json=> {:success=>true, :auth_token=>resource.authentication_token, :email=>resource.email}
      return
    end
    invalid_login_attempt
  end

  def destroy
    resource = User.find_for_database_authentication(:email => params[:email])
    resource.authentication_token = nil
    resource.save
    render json: { success: true }, status: :ok
  end

  protected
    def invalid_login_attempt
      render json: {success: false, message: "Error with your login or password"}, status: :unauthorized
    end
end
