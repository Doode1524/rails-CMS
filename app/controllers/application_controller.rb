class ApplicationController < ActionController::Base

  include SessionsHelper

  helper_method :current_user
  helper_method :logged_in
  helper_method :logout

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
        
  def logged_in?
    !!current_user
  end
    
  def logout
    session.clear
  end
  
end
