class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in? #makes these available to view templates

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id] #returns the User saved in session
  end

  def logged_in? # turns current_user into a boolean. so current_user if we want the user, logged_in? if just wanna check status
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:error] = 'Sign in first?'
      redirect_to :back
    end
  end
end
