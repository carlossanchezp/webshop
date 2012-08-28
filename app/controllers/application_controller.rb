class ApplicationController < ActionController::Base
  protect_from_forgery


  before_filter :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end


  def logged_in?
    session[:user_id].present?
  end

  def current_user
    if logged_in?
      @current_user = User.find session[:user_id]
    end
  end
  helper_method :logged_in?, :current_user
end
