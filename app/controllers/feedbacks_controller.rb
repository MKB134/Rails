class FeedbacksController < ApplicationController
  before_action :authenticate_user!

  def new; end

  def show; end

  def create
    body = params[:body]
    user = current_user
    FeedbacksMailer.feedback_message(body, user).deliver_now
    redirect_to new_feedback_path
  end
end
