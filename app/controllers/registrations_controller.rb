class RegistrationsController < Devise::RegistrationsController
  include ActionController::MimeResponds
  include ActionController::ImplicitRender
  before_action :configure_permitted_parameters
  include Devise::Controllers::Helpers

  respond_to :json

  def create
    self.resource = build_resource(sign_up_params)

    if resource.save
      if resource.active_for_authentication?
        sign_up(resource_name, resource)
        respond_with resource, :location => after_sign_up_path_for(resource), serializer: SessionSerializer, root: "user"
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      respond_with resource
    end
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) do |u|
        u.permit(:first_name, :last_name, :email, :password, :password_confirmation)
      end
    end

end
