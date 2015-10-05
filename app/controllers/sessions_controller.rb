class SessionsController < ApplicationController

  def new
    if session[:logged_in?]
      @current_user = User.find_by id: session[:user_id]
      redirect_to @current_user
    else
      render 'new'  
    end
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end
end
