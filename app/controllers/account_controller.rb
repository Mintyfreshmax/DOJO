class AccountController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @clubs = @user.clubs
    @activities = @user.activities
    @club = Club.new
  end

  def create_club
    @club = current_user.clubs.build(club_params)
    if @club.save
      redirect_to account_path, notice: 'Club was successfully created.'
    else
      @user = current_user
      @clubs = @user.clubs
      @activities = @user.activities
      render :show
    end
  end

  private

  def club_params
    params.require(:club).permit(:name, :details, :address)
  end
end
