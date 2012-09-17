class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :logged_in?, :current_user, :is_admin?

  before_filter :login_required


# Admin user who's that?
  def is_admin?
    current_user.is_admin
  end

# User sections
  def current_user
    if logged_in?
      @current_user = User.find session[:user_id]
    end
  end

  def logged_in?
    session[:user_id] ? true : false
  end


  private

  def login_required
    unless logged_in?
       redirect_to login_url
    end
  end

end
