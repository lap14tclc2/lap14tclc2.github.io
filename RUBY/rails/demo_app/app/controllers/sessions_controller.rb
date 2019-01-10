class SessionsController < ApplicationController
  # get page login
  def new
  end

  #login with Post request
  def create
    user =  User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # login successfully
      # save user's id to session
      log_in user

      #check whether 'remember me' checkbox is checked or not
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)

      redirect_back_or user_url(user)
    else
      flash.now[:danger] = "Invalid information"
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    flash[:success] = "Log out successfully"
    redirect_to root_url
  end
end
