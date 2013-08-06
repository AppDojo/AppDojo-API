class MeetingsController < ApplicationController
  # TODO: Only admin users? can create meetings
  before_action :authenticate_user!

  def index
    @meetings = Meeting.all
    render json: @meetings, status: :ok
  end

  def create
    @meeting = Meeting.new(meeting_params)

    if @meeting.save
      render json: @meeting, status: :ok
    else
      render json: {success: false, message: "Unable to create meeting"}, status: :unprocessable_entity
    end
  end

private
  def meeting_params
    params.require(:meeting).permit(:name, :start_time)
  end
end
