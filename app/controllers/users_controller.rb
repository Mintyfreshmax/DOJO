class UsersController < ApplicationController
  before_action :authenticate_user!

  def profile
    @user = current_user
  end

  def account
    @clubs = current_user.clubs
    @club = Club.new
  end
end
