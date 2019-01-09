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
        redirect_to login_path
      else
        render 'new'
      end
    end
    
    def edit
    end

    def update
    end

    def destroy
    end

    private
    
    # use strong parameter to get valid information to create or update user
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
