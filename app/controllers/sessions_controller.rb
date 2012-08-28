class SessionsController < ApplicationController

  before_filter :login_required, :only => [:logout]

  # GET /products
  # GET /products.json
  def new
    #@user_session = UserSession.new
    @user = User.new
  end


  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      # Sign the user in and redirect to the user's show page.
      session[:user_id] = @user.id
      flash[:notice] = "Login successful!"
      redirect_to products_path, :notice => "Loggin in!"
    else
      flash[:notice] = "Invalid email/password combination" # Not quite right!
      render :new
    end
  end

  def destroy
    session[:user_id] = nil

    flash[:notice] = "You have been logged out."
    redirect_to root_url, :notice => "logged out!!!"
  end
 end