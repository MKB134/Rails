class ApplicationController < ActionController::Base

  helper_method :current_user,
                :logged_in?,
                 :return_point
  private

  def authenticate_user!
    unless current_user
      set_return_point(request.url)
      redirect_to login_path, alert: 'Are you a Guru? Verify your Email and password please'
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def set_return_point(return_point)
    session[:return_point] = return_point
  end

  def return_point
    session[:return_point] || root_path
  end
end
