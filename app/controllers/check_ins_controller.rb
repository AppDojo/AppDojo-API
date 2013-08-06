class CheckInsController < ApplicationController
  before_action :authenticate_user!

  def index
    @check_ins = CheckIn.all
    render json: @check_ins, status: :ok
  end

  def create
    @check_in = CheckIn.new(check_in_params)

    if @check_in.save
      render json: @check_in, status: :ok
    else
      render json: {success: false, message: "Unable to check into the meeting"}, status: :unprocessable_entity
    end
  end

private
  def check_in_params
    params.require(:check_in).permit(:user_id, :meeting_id)
  end
end
