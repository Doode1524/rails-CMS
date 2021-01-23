class CommentsController < ApplicationController

    def new
        @comment = Comment.new
    end

    def index
        @comments = Comment.all
    end

    def show
        @comment = Comment.find_by_id(params[:id])
    end

    def create
        @comment = Comment.new(comment_params)
        if @comment.save
            redirect_to @comment
        else
            render :new
        end
    end

    def comment_params
        params.require(:comment).permit(:content, :article_id, :user_id)
    end
end
