class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!

  def hello
    render json: {hello: 'world'}, status: 200
  end

  def ping
    render text: 'pong', status: 200
  end
end
