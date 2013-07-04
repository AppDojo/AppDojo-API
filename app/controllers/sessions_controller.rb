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
      render :json=> {success: true, auth_token: resource.authentication_token, user: resource}
      return
    end
    invalid_login_attempt
  end

  def destroy
    resource = User.find_by_authentication_token(params[:auth_token] || request.headers['X-AUTH-TOKEN'])
    resource.authentication_token = nil
    resource.save
    sign_out(resource_name)
    render json: {success: true}.to_json, status: :ok
  end

  protected
    def invalid_login_attempt
      render json: {success: false, message: "Invalid login or password."}, status: :unauthorized
    end
end
