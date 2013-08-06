class CustomAuthFailure < Devise::FailureApp
  def respond
    self.status = 401
    self.content_type = 'json'
    self.response_body = {success: false, message: "Invalid authentication credentials"}.to_json
  end
end