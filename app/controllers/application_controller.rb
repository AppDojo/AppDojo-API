class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  include ActionController::StrongParameters

  prepend_before_action :get_auth_token


  protected
    def get_auth_token
      params[:auth_token] ||= request.headers['X-AUTH-TOKEN']
    end
end
