class ActivitiesController < ApplicationController
  before_action :set_activity, only: %i[show edit update destroy]

  def index
    @activities = Activity.all

    if params[:query].present?
      @activities = @activities.where("title ILIKE ? OR description ILIKE ?", "%#{params[:query]}%", "%#{params[:query]}%")
    end

    if params[:category].present?
      @activities = @activities.where("category ILIKE ?", "#{params[:category]}")
    end

    @markers = @activities.geocoded.map do |activity|
      {
        lat: activity.latitude,
        lng: activity.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {activity: activity}),
        marker_html: render_to_string(partial: "markers")
      }
    end

    respond_to do |format|
      format.html # For full page loads
      format.turbo_stream # For Turbo Stream updates
    end
  end

  def show
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
    params.require(:activity).permit(:title, :description, :teacher, :category, :address, :limit, :event_type, :duration)
  end
end
