class SessionsController < ApplicationController

  def new
    if logged_in?
      flash[:warning] = "You are already logged in!"
      redirect_to :root
    end
  end

  def stuff
  end
  
  def create
      user = User.find_by(name: params[:session][:name])&.authenticate(params[:session][:password])
      if user
          session[:user_id] = user.id
          redirect_to :root
        else
          flash.now[:warning] = "Your credentials do not match!"
          render :new
      end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have been successfully logged out!"
    redirect_to :root
  end

end
