class RepliesController < ApplicationController
    def create
        @reply = Reply.new(reply_params)
        @comment = @reply.comment
        @article = @comment.article
        @reply.user_id = current_user.id

        if @reply.save

        redirect_to article_comments_path(@article)#route to art/id/com/id
        else
             render :'/comments/index'
        end
    end

    def edit
        find_reply
        @comment = @reply.comment
    end

    def update
        find_reply
        article = @reply.comment.article
        if @reply.update(reply_params)
            redirect_to article_comments_path(article)
        else 
            render :edit
        end
    end

    def destroy
        find_reply
        article = @reply.comment.article
        @reply.delete
        redirect_to article_comments_path(article)
    end

    private

    def reply_params
        params.require(:reply).permit(:content, :comment_id)
    end

    def find_reply
        @reply = Reply.find_by(params[:id])
    end
end