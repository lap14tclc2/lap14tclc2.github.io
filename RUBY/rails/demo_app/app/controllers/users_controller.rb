class UsersController < ApplicationController
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
        redirect_to login_url
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
end
