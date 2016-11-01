class UsersController < ApplicationController


    # before_action :find_user, only: [:edit, :update]


    def new
      if logged_out?
        @user = User.new
      else
        flash[:warning] = "You already have an account!"
        redirect_to :root
      end
    end

    def create
      @user = User.new(user_params)
      @user.save
      if @user.save
        redirect_to root_path
      else
        render :new
      end
    end


  private

    def user_params
      params.require(:user).permit(:name, :email, :bio, :password, :password_confirmation)
    end


end
