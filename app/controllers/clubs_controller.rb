class ClubsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  before_action :set_club, only: [:show, :edit, :update, :destroy]

  def show
    @club = Club.find(params[:id])
    @club.details = "This is a sample description for the club. It contains detailed information about the club's activities, events, and other relevant information that members might find useful. The description is long enough to test the 'Learn More' functionality, which will reveal the rest of the text when clicked."
    @activities = @club.activities
    @clubs = Club.all
    @messages = @club.messages
    @message = Message.new
    @messages_by_day = @club.messages.order(created_at: :desc).group_by { |message| message.created_at.to_date }
    @markers =
      [{
        lat: @club.latitude,
        lng: @club.longitude,
        marker_html: render_to_string(partial: "activities/markers")
      }]
      @positive_feedbacks_sum = @activities.joins(:feedbacks).where(feedbacks: { appreciation: true }).count
    end

  def new
    @club = Club.new
  end


  def manage_dojos
    @clubs = current_user.clubs
  end

  def create
    @club = current_user.clubs.build(club_params)
    if @club.save
      redirect_to club_path(@club), notice: 'Club was successfully created.'
    else
      @user = current_user
      @clubs = @user.clubs
      render :show
    end
  end

  def edit

  end

  def update
    @club = Club.find(params[:id])
    if @club.update(club_params)
      redirect_to @club, notice: 'Club was successfully updated.'
    else
      render :edit
    end
  end

    def destroy
      @club = Club.find(params[:id])
      @club.destroy
      redirect_to manage_dojos_path, status: :see_other
    end

  private

  def set_club
    @club = Club.find(params[:id])
  end

  def club_params
    params.require(:club).permit(:name, :username, :image, :image_url, :details, :address, :instagram_link, :phone_number, :IBAN)
  end
end
