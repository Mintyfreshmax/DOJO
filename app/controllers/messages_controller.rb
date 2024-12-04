class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_club, only: :create

  def create
    @message = Message.new(message_params)
    @message.user = current_user
    @message.club = @club
    # TODO Sandor: define club.messages in the clubs controller - show
  end

  private

  def set_club
    @club = Club.find(params[:club_id])
  end

  def feedback_params
    params.require(:feedback).permit(:content)
  end
end
