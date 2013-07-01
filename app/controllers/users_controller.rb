class UsersController < ApplicationController
  before_filter :authenticate_user!, except: [:create]
  def index
    @user = User.all
    render json: @user
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      render json: @user, status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end
end


