class RepliesController < ApplicationController
    before_action :require_login
    before_action :find_reply, except: [:new, :create]
    before_action :reply_comment, except: [:new, :create, :destroy]
    before_action :article_comment, except: [:new, :create, :destroy]

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
 
    end

    def update
        if @reply.update(reply_params)
            redirect_to_index
        else 
            render :edit
        end
    end

    def destroy
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
    
    def reply_comment
        @comment = @reply.comment
    end
    
end