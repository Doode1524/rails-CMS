class RepliesController < ApplicationController
    def create
        reply = Reply.new(reply_params)
        comment = reply.comment
        article = comment.article
        reply.user_id = current_user.id

        if reply.save

        redirect_to article_comments_path(article)#route to art/id/com/id
        else
             render '/articles/show'
        end
    end

    private

    def reply_params
        params.require(:reply).permit(:content, :comment_id)
    end
end