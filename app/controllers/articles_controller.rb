class ArticlesController < ApplicationController
    
    def index
        Api.load_data
        articles = Article.all.sort_by(&:published_at).reverse
        @articles = Kaminari.paginate_array(articles).page(params[:page]).per(25)
    end

    def show
        @article = Article.find_by_id(params[:id])
    end

end
