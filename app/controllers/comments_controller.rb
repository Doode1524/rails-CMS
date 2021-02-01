class CommentsController < ApplicationController
    before_action :require_login 
    before_action :find_comment, only: [:show, :edit, :update, :destroy, :delete]
    before_action :find_article, only: [:index]
    before_action :article_comments, only: [:index]
    
    def index
        if @article
            @comment = Comment.new
            @reply = Reply.new
        else
          @comments = Comment.all
        end
    end

    def new
        @comment = Comment.new
    end

    def show
        @article = @comment.article
        if params[:article_id]
            @comments = Article.find(params[:article_id]).comments
            @article = Article.find(params[:article_id])
        else
            redirect_to article_path(@article)
        end

    end

    def create
        @comment = Comment.new(comment_params)
        @article = @comment.article
        @comment.user_id = current_user.id
     
        if @comment.save
        redirect_to article_comments_path(@article)
        else
            render :index
        end
    end


    def edit
        @article = @comment.article
    end

    def update
        @article = @comment.article
        if @comment.update(comment_params)
            redirect_to article_comments_path(@article)
        else
            render :edit          
            
        end
    end

    def destroy
        article = @comment.article
        @comment.delete
        redirect_to article_comments_path(article)
    end

    private
    def find_comment
        @comment = Comment.find_by_id(params[:id])
    end

    def comment_params
        params.require(:comment).permit(:content, :article_id)
    end

    def find_article
        @article = Article.find(params[:article_id]) 
    end

    def article_comments
        @comments= @article.comments if @article
    end



end