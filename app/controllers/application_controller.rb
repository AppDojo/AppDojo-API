class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  include ActionController::ImplicitRender
  include ActionController::StrongParameters

  before_action :authenticate_user!

  respond_to :json
end
