class ActivitiesController < ApplicationController
  before_action :set_activity, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

  def my_activities
    @upcoming_activities = current_user.bookings.map(&:activity).select { |activity| activity.event_time.future? }
    @attended_activities = current_user.bookings.map(&:activity).select { |activity| activity.event_time.past? }
  end

  def index
    @activities = Activity.all
    if params[:activity].present?
      @activities = @activities.where("title ILIKE ? OR description ILIKE ?", "%#{params[:activity]}%", "%#{params[:activity]}%")
    elsif params[:location].present?
      @activities = @activities.near(params[:location], 100)
    elsif params[:category].present?
      @activities = @activities.where("category ILIKE ?", "#{params[:category]}")
    end

    @markers = @activities.geocoded.map do |activity|
      {
        lat: activity.latitude,
        lng: activity.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {activity: activity}),
        marker_html: render_to_string(partial: "markers", locals: { activity: activity }),
        path: activity_path(activity)
      }
    end

    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  def show
    @activity = Activity.find(params[:id])
    @markers = [{
      lng: @activity.longitude,
      lat: @activity.latitude,
      marker_html: render_to_string(partial: "activities/markers")
    }]
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    @club = Club.find(params[:club_id])
    @activity.club = @club
    @activity.save
    redirect_to activity_path(@activity)
  end

  def edit
  end

  def update
    @activity.update(activity_params)
    redirect_to activity_path(@activity)
  end

  def destroy
    @activity.destroy
    redirect_to activities_path, status: :see_other
  end

  private

  def set_activity
    @activity = Activity.find(params[:id])
  end

  def activity_params
    params.require(:activity).permit(:title, :description, :teacher, :category, :address, :limit, :event_type, :duration, :booking)
  end
end
