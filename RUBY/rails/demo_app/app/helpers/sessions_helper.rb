module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  # set current user
  def current_user
    # check if user is existed in session
    if (user_id = session[:user_id])
      @current_user ||= User.find(user_id)
    end
  end

  #check user is current user?
  def current_user?(user)
    user == current_user
  end

  # if current user is existed so he logged in
  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end


end
