class FeedbacksMailer < ApplicationMailer
  def feedback_message(body, user)
    @body = body
    @user = user

    mail to: Admin.pluck(:email)
  end
end
