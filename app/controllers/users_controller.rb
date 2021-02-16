class UsersController < ApplicationController

    before_action :find_user, only: [:show, :edit, :update, :destroy]
    before_action :require_login
    before_action :all_users, only: [:show, :index]
    skip_before_action :require_login, only: [:new, :create] 

    def index
        
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            log_in @user
            redirect_to articles_path
        else
            render :new
        end
    end
    
    def show
        @articles = Article.all.max_by(5){|a| (a.comments.length + a.replies.length)}
    end

    def edit

    end

    def update
        if @user.update(user_params)
            redirect_to user_path(@user)
        else
            render :new           
        end
    end

    def delete
        @user.delete
        redirect_to :new
    end

    private

    def find_user
        @user = User.find_by_id(params[:id])
    end

    def user_params
        params.require(:user).permit(:username, :email, :password, :avatar)
    end

    def all_users
        @users = User.all
    end

end




