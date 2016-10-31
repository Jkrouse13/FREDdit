class SessionsController < ApplicationController

  def new
    if logged_in?
      flash[:warning] = "You are already logged in!"
      redirect_to :root
    end
  end

  def create
      user = User.find_by(name: params[:session][:name])
      if user
        if user.authenticate(params[:session][:password])
          session[:user_id] = user.id
          redirect_to :root
        else
          flash[:warning] = "Your password is incorrect!"
          render :new
        end
      else
        flash[:warning] = "There is no user by that name here."
        render :new
      end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have been successfully logged out!"
    redirect_to :root
  end

end
