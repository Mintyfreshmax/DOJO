class FeedbacksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_activity, only: :create

  def create
    @feedback = Feedback.new(feedback_params)
    @feedback.user = current_user
    @feedback.activity = @activity
    if @feedback.save
      redirect_to activity_feedbacks_path(@activity)
      flash[:success] = 'Feedback created successfully!'
      redirect_to activity_path(@activity)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_activity
    @activity = Activity.find(params[:activity_id])
  end

  def feedback_params
    params.require(:feedback).permit(:appreciation)
  end
end
