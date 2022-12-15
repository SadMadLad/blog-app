class ArticlesController < ApplicationController
	before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = current_user.articles.new
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      redirect_to root_path, notice: "Article created succesfully"
    else
      flash[:alert] = @article.errors.full_messages.first
      render :new, status: :unprocessable_entity
    end
  end


  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to root_path, notice: "Article Edited Successfully"
    else
      flash[:alert] = @article.errors.full_messages.first
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    redirect_to root_path, status: :see_other, notice: "Article Deleted Successfully"
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :image)
  end

  def set_article
    @article = Article.find(params[:id])
    authorize @article
  end
end
