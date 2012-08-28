module SessionHelper
  def sign_in(user)


  end

  def signed_in?
    !current_user.nil?
  end

end
