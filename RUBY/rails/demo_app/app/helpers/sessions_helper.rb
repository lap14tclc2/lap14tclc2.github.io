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
    #delete session and cookie
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end

  def remember(User)
    #add encrypted remember token to db
    user.remember
    # add remember token to cookie
    cookie.permanent[:remember_token] = user.remember_token
    # add encrypted user's id to cookie
    cookie.permanent.signed[:user_id] = user.id
  end

  def forget(user)
    #set encrypted remember token in databse is nil
    user.forget
    #delete information in cookie
    cookie.delete(:user_id)
    cookie.delete(:remember_token)
  end

  #redirect to stored location(or to the default)
  def redirect_back_or(default)
    redirect_to (session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end
      
  #store the url trying to be accessing
  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end
end
