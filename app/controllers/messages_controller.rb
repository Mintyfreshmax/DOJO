class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_club, only: :create

  def create
    @message = Message.new(message_params)
    @message.user = current_user
    @message.club = @club
    if @message.save
      redirect_to club_path(@club)
    else
      @activities = @club.activities
      @messages = @club.messages
      render "clubs/show", status: :unprocessable_entity
    end
  end

  private

  def set_club
    @club = Club.find(params[:club_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
