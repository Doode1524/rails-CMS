class RepliesController < ApplicationController
    before_action :require_login

    def new
        @reply = Reply.new
        @comment = Comment.find_by_id(params[:id])
        article_comment
    end
    
    def create
        @reply = Reply.new(reply_params)
        reply_comment
        article_comment
        @reply.user_id = current_user.id

        if @reply.save
            redirect_to_index #route to art/id/com/id
        else
            render :'new'
        end
    end

    def edit
        find_reply
        reply_comment
        article_comment
    end

    def update
        find_reply
        reply_comment
        article_comment
        if @reply.update(reply_params)
            redirect_to_index
        else 
            render :edit
        end
    end

    def destroy
        find_reply
        @article = @reply.comment.article
        @reply.delete
        redirect_to_index
    end

    private

    def reply_params
        params.require(:reply).permit(:content, :comment_id)
    end

    def find_reply
        @reply = Reply.find_by_id(params[:id])
    end

    def article_comment
        @article = @comment.article
    end

    def reply_comment
        @comment = @reply.comment
    end

    def redirect_to_index
        redirect_to article_comments_path(@article)
    end

end