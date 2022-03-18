class ApplicationController < ActionController::Base

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def after_sign_in_path_for(user)
   if user.is_a?(Admin)
     admin_tests_path
   else
     tests_path
   end
 end
end
