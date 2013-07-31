module SessionsHelper

  def authenticate
    unless logged_in?
      redirect_to new_session_url
    end
  end

  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def logged_in?
    !!current_user
  end

  def login_user(user)
    token = SecureRandom.base64(16)

    user.session_token = token
    session[:session_token] = token
    user.save
  end

  def logout_user
    token = SecureRandom.base64(12)
    current_user.session_token = token
    session[:session_token] = nil
    current_user.save
  end
end
