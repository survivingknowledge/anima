class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticate!
    if !current_user || session[:user_id].empty?
      redirect_to new_session_path
    end
  end

  def current_user
    @user ||= User.find(session[:user_id])
  end
end
