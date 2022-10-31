class FeedbacksMailer < ApplicationMailer
  def feedback_message(body, user)
    @body = body
    @from = user.email

    Admin.all.each { |admin| mail(to: admin.email , subject: "Message from #{@from}") }
  end
end
