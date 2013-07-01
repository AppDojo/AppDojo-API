class SessionsController < ApplicationController

  def create
    puts "PARAMS #{params.inspect}"
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      render json: @user, status: :ok
    else
      render json: @user.errors, status: :unauthorized
    end
  end

  def destroy

  end
end
