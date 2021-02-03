class CommentsController < ApplicationController
    before_action :require_login 
    before_action :find_comment, only: [:edit, :update, :destroy, :delete]
    before_action :find_article, only: [:index]
    before_action :article_comments, only: [:index]
    
    def index
        if @article
            new_comment
            @reply = Reply.new
        else
            @comments = Comment.all
        end
    end

    def new
        new_comment
    end

    def create
        @comment = Comment.new(comment_params)
        article_comment
        @comment.user_id = current_user.id
     
        if @comment.save
            redirect_to_index
        else
            render :index
        end
    end

    def edit
        article_comment
    end

    def update
        article_comment
        if @comment.update(comment_params)
            redirect_to_index
        else
            render :edit          
        end
    end

    def destroy
        article_comment
        @comment.delete
        redirect_to_index
    end

    private
    
    def find_comment
        @comment = Comment.find_by_id(params[:id])
    end

    def comment_params
        params.require(:comment).permit(:content, :article_id)
    end

    def find_article
        @article = Article.find_by(id: params[:article_id])
        redirect_to articles_path unless @article
    end

    def article_comments
        @comments= @article.comments if @article
    end

    def redirect_to_index
        redirect_to article_comments_path(@article)
    end
    
    def new_comment
        @comment = Comment.new
    end

    def article_comment
        @article = @comment.article
    end

end