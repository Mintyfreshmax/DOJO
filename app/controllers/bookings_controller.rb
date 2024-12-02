class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_activity, only: :create

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.activity = @activity
    if @booking.save
      flash[:success] = "Congrats 🎉 You successfully booked the activity #{@activity.title} at the dojo #{@activity.club.name}.
      Meeting will happen at the address #{@activity.address} on #{@activity.event_time.strftime("%a %b %e at %l:%M %p")}"
      redirect_to activity_path(@activity)
    else
      flash[:alert] = "Your booking was unsuccessful, please try again"
      render "activities/show", status: :unprocessable_entity
    end
  end

  private

  def set_activity
    @activity = Activity.find(params[:activity_id])
  end

  def booking_params
    params.fetch(:booking, {}).permit(:start_date, :end_date)
  end
end
