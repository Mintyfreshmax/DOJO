class FeedbacksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_activity, only: :create

  def create
    # if Feedback.exists?(user: current_user, activity: @activity)
    #   flash[:error] = "You have already provided feedback for this activity."
    #   redirect_to activity_feedbacks_path and return
    #   raise
    # end

    @feedback = Feedback.new(feedback_params)
    @feedback.user = current_user
    @feedback.activity = @activity

    if @feedback.save
      flash[:success] = 'Thanks for your feedback!'
      redirect_to activity_feedbacks_path
    else
      flash[:error] = "Failed to submit feedback."
      redirect_to activity_feedbacks_path, status: :unprocessable_entity
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
