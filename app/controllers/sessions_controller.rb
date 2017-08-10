class SessionsController < ApplicationController

  #login form
  def new
  end

  #create session variables
  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      log_in @user
      redirect_to root_path
    else
      render :new
    end
  end

  #destroy a session
  def destroy
    log_out if logged_in?
    redirect_to root_path
  end

end
