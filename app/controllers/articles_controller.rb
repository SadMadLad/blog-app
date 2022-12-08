class ArticlesController < ApplicationController
    def index
        @articles = Article.all
    end

    def show
        @article = Article.find(params[:id])
    end

    def new
        @article = current_user.articles.new
    end

    def create
        @article = current_user.articles.new(article_params)

        if @article.save
            redirect_to @article
        else
            flash[:errs] = @article.errors.full_messages
            render :new, status: :unprocessable_entity
        end
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy

        redirect_to root_path, status: :see_other
    end

    private
    def article_params
        params.require(:article).permit(:title, :body, :image)
    end
end
