module ApplicationHelper
  def alert
    if flash[:alert]
      "<p>#{flash[:alert]}</p>".html_safe
    end
  end

  def notice
    if flash[:notice]
      "<p>#{flash[:notice]}</p>".html_safe
    end
  end

  def welcome_user
    if logged_in?
      "<p>Hello again #{current_user.firstname} #{current_user.lastname} - #{link_to "Logout", logout_path}</p>".html_safe
    end
  end
end
