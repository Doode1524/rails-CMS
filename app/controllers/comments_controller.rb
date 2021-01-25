class CommentsController < ApplicationController
    
    before_action :find_comment, only: [:show, :edit, :update, :destroy, :delete]
    
    def index
        @comment = Comment.new
        if params[:article_id]
            @comments = Article.find(params[:article_id]).comments     
            @article = Article.find(params[:article_id])
            @reply = Reply.new
        else
            @comments = Comment.all
        end
    end
    
    def new
        @comment = Comment.new
        # comment.user_id = user.id
        # if comment.save
        #     redirect_to article_comments_path(article)
        # else
        #     render '/articles/show'
        # end
    end

    def show 
        if params[:article_id]
            @comments = Article.find(params[:article_id]).comments
            @article = Article.find(params[:article_id])
        else
            redirect_to article_path(article)
        end

    end

    def create
        comment = Comment.new(comment_params)
        article = comment.article
        comment.user_id = current_user.id
     
        if comment.save
        redirect_to article_comments_path(article)
        else
            render '/articles/show'
        end
    end


    def edit
        @article = @comment.article
    end

    def update
        article = @comment.article
        if @comment.update(comment_params)
            redirect_to article_comments_path(article)
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


end