class UsersController < ApplicationController
  before_action :authenticate_user!

  def profile
    @feedbacks = current_user.feedbacks
  end

  def account
    @clubs = current_user.clubs
    @club = Club.new
  end

private

def feedback_params
  params.fetch(:feedback, {}).permit(:appreciation)
end
end
