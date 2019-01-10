class UsersController < ApplicationController
  #only logged-in user has ability to perform these actions
  before_action :logged_user_in, only: [:index, :edit, :update, :show, :destroy]
  # current user wasn't allowed to access other user's information and he/she only view and update his/her information
  before_action :not_same_user, only: [:show, :edit, :update]

  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def new
     @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save 
      #create user successfully
      flash[:success] = "Login to the page"
      redirect_to user_url(@user)
    else
      render 'new'
    end
  end
    
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # update successfully
      flash[:success] = "Profile updated!"
      redirect_to user_url(@user)
    else
      render 'edit'
    end
  end

  def destroy
  end

  private
    
  # use strong parameter to get valid information to create or update user
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
  
  # the current user cannot access to another user's information 
  def not_same_user
    @user = User.find(params[:id])
    flash[:danger] = "You can not access to #{ @user.email }"
    redirect_to root_url if (!current_user?(@user))
  end

  def logged_user_in
    # if user haven't logged in then forcing user must log in
    unless logged_in?
      flash[:danger] = "You hav to sign your account to the page"
      redirect_to login_url
    end
  end

end
