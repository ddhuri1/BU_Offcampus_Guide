class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :can_proceed
  helper_method :current_user, :logged_in?

  # Similar to a private method:  Can be invoked with or without self 
  #   OR an object that inherits from self (self represents THIS defining class)
  # Can NOT be invoked by a route!
  protected

  # guards against unauthorized access
  def can_proceed
    redirect_to welcome_login_path and return unless current_user
  end
  
  # accessor
  def current_user
    # Avoids unnecessary database queries if already set
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # predicate
  def logged_in?
    # So it returns true or false
    !!current_user
  end
  
  # setter (gets set in sessions controller)
  def current_user=(user)
    @current_user = user
  end
end

