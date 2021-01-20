class ArticlesController < ApplicationController
    
    def index
        Api.load_data
        @articles = Article.all
    end

    def show
        @article = Article.find_by_id(params[:id])
    end

end
