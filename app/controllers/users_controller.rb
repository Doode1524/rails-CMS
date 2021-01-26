class UsersController < ApplicationController

    before_action :find_user, only: [:show, :edit, :update, :destroy]

    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        user = User.new(user_params)
        if user.save
            log_in user
            redirect_to user_path(user)
        else
            render :new
        end
    end
    
    def show
    
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
        params.require(:user).permit(:username, :email, :password, :subscription_ids => [])
    end

end

    # def article_info
    #     current_user.articles.each do |article|
    #         article.attributes.except("language", "country", "author", "category")
    #     end
    # end


