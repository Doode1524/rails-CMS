class ArticlesController < ApplicationController
    before_action :require_login
    before_action :redirect_if_article_not_found, only: [:create, :update]
    
    def index
        # Api.load_data     #<----Uncomment to explicitly seed articles
        @users = User.all
        @comment = Comment.new
        filter_and_paginate_articles
    end

    def create
        redirect_to articles_path
    end

    def update
        find_article
        if @article.update(article_params)
            redirect_to articles_path
        else
            render :show
        end

    end

    private
    def find_article
        @article = Article.find_by_id(params[:id])
    end

    def article_params
        params.require(:article).permit(comment_attributes: [:content])
    end

    def redirect_if_article_not_found
        redirect_to articles_path unless @article
    end

    def filter_and_paginate_articles
        if !params[:source].blank?
            articles = Article.by_source(params[:source])
            @articles = Kaminari.paginate_array(articles).page(params[:page]).per(10)
        else
            articles = Article.all.sort_by(&:published_at).reverse
            @articles = Kaminari.paginate_array(articles).page(params[:page]).per(10)
        end
    end
end
