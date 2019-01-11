module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  # set current user
  def current_user
    # check if user is existed in session
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    # else if cookie has user
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      #check if user is valid and remember token in cookie is match the one in database
      if user && user.authenticated?(cookies[:remember_token])
        p user && user.authenticated?(cookies[:remember_token])
        #save user's id to current session and set user to current user
        log_in user 
        @current_user = user
      end
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

  def remember(user)
    #add encrypted remember token to db
    user.remember
    # add remember token to cookie
    cookies.permanent[:remember_token] = user.remember_token
    # add encrypted user's id to cookie
    cookies.permanent.signed[:user_id] = user.id
  end

  def forget(user)
    #set encrypted remember token in databse is nil
    user.forget
    #delete information in cookie
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  #redirect to stored location(or to the default)
  def redirect_back_or(default)
    redirect_to (session[:forwarding_url] || default)
    # delete after forwarding
    session.delete(:forwarding_url)
  end
      
  #store the url trying to be accessing
  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end
end
