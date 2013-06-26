class UsersController < ApplicationController

  def index
    @user = User.all
    render json: @user
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      render json: @user, status: 201
    end
  end
end
