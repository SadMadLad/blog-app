class ArticlesController < ApplicationController
    def index
        if current_user
            @articles = Article.all
        end
    end

    def show
    end
end
