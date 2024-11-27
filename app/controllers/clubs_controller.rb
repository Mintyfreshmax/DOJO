class ClubsController < ApplicationController
  def show
    @club = Club.find(params[:id])
    @club.details = "This is a sample description for the club. It contains detailed information about the club's activities, events, and other relevant information that members might find useful. The description is long enough to test the 'Learn More' functionality, which will reveal the rest of the text when clicked."
    @activities = @club.activities
  end
end
