class StaticPagesController < ApplicationController
  def home
    flash[:danger] = "You must login"
    redirect_to login_url unless logged_in?
  end

  def help
  end

  def about
  end

  def contact
  end
end
