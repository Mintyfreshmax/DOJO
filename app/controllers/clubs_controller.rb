class ClubsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def show
    @club = Club.find(params[:id])
    @club.details = "This is a sample description for the club. It contains detailed information about the club's activities, events, and other relevant information that members might find useful. The description is long enough to test the 'Learn More' functionality, which will reveal the rest of the text when clicked."
    @activities = @club.activities
    @clubs = Club.all
    @markers = @clubs.geocoded.map do |club|
      {
        lat: club.latitude,
        lng: club.longitude
      }
    end
  end

  def new
    @club = Club.new
  end

  def my_clubs
    @clubs = current_user.clubs
    @club = Club.new
  end

  def create
    @club = current_user.clubs.build(club_params)
    if @club.save
      redirect_to my_clubs_path, notice: 'Club was successfully created.'
    else
      @user = current_user
      @clubs = @user.clubs
      render :show
    end
  end

    def destroy
      @club = Club.find(params[:id])
      @club.destroy
      redirect_to my_clubs_path, notice: 'Club was successfully deleted.'
    end

  private

  def set_club
    @club = Club.find(params[:id])
  end

  def club_params
    params.require(:club).permit(:name, :username, :image, :details, :address, :instagram_link, :phone_number, :IBAN)
  end
end
