class UsersController < ApplicationController
  before_action :authenticate_user!

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to account_path, notice: 'Profile updated successfully.'
    else
      render :edit
  end

  def profile
    @feedbacks = current_user.feedbacks
  end

  def account
    @clubs = current_user.clubs
    @club = Club.new
  end

end

private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation, :profile_picture)
  end

  def feedback_params
    params.fetch(:feedback, {}).permit(:appreciation)
  end
end
