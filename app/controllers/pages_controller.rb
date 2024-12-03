class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home


  def index
    start_date = params.fetch(:start_date, Date.today).to_date
    @meetings = Meeting.where(start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
  end

  def home
    redirect_to activities_path if user_signed_in?
  end
end
