class UsersController < ApplicationController

  def index
    @user = User.all
    render json: @user
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      render @user
    end
  end
end
