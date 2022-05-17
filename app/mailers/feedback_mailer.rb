class FeedbackMailer < ApplicationMailer
  def feedback_message(body,user)
    @body = body
    @user = user

    mail to: ENV['SMTP_USERNAME'], from: user.email
  end
end
