class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?, :time_since  #makes these available to view templates

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id] #returns the User saved in session
  end

  def logged_in? # turns current_user into a boolean. so current_user if we want the user, logged_in? if just wanna check status
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:error] = 'please first sign in.'
      redirect_to :back
    end
  end

  def time_since(time) # takes a DateTime object, built to work with created_at

    diff = Time.now - DateTime.parse(time.to_s).to_time # time diff in seconds
    
    years = (diff / (60 * 60 * 24 * 365)).floor
    months = (diff / (60 * 60 * 24 * 30)).floor
    days = (diff / (60 * 60 * 24)).floor
    hours = (diff / (60 * 60)).floor
    minutes = (diff / 60).floor
    
    # decide format to show time

    if diff < 60
      # posted just now
      time_diff = 'literally seconds ago'
    elsif minutes < 60
      # show time in minutes
      time_diff = minutes.to_s + ' minutes ago'
    elsif hours < 24
      # show time in hours
      time_diff = hours.to_s + ' hours ago'
    elsif days < 30
      # show time in days
      time_diff = days.to_s + ' days ago'
    elsif months < 12
      # show time in months
      time_diff = months.to_s + ' months ago'
    else 
      # show time in years
      time_diff = years.to_s + ' years ago'
    end

    return time_diff

  end

end
