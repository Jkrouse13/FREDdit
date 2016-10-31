class UsersController < ApplicationController


    # before_action :find_user, only: [:edit, :update]


    def new
      @user = User.new
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
