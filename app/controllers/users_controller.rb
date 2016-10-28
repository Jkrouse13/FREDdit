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



    def edit
      render :new
    end

    def update
      @user.update(user_params)
      @user.save
      redirect_to :root
    end

  private

    def find_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name)
    end


end
