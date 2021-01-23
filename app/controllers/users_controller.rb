class UsersController < ApplicationController

    def index   
        @users = User.all
    end

    def show
        find_user
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def edit

    end

    def update

    end

    def destroy

    end

    def find_user   
        @user = User.find_by_id(params[:id])
    end

    def user_params
        params.require(:user).permit(:username, :email, :password_digest)
    end
end
