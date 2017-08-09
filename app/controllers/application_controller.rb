class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticate!
    if current_user.nil?
      redirect_to new_session_path
    end
  end

  def current_user
    @user ||= User.find_by_id(session[:user_id])
  end
end
