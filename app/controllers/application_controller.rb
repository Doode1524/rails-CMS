class ApplicationController < ActionController::Base

  include SessionsHelper

  helper_method :current_user
  helper_method :logged_in?
  helper_method :logout
  helper_method :require_login

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
        
  def logged_in?
    !!current_user
  end
    
  def logout
    session.clear
  end

  def require_login
    redirect_to login_path unless session.include? :user_id
  end

  def article_comment
    @article = @comment.article
  end

  def redirect_to_index
    redirect_to article_comments_path(@article)
  end

  # def fallback
  #   redirect_to articles_path
  # end
  
end
