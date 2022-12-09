class ArticlesController < ApplicationController
	before_action :set_article, only: [:show, :destroy]

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
			redirect_to @article, flash[:notice]: 'Article Created Successfully'
		else
			flash[:errs] = @article.errors.full_messages
			render :new, status: :unprocessable_entity
		end
	end

	def destroy
		@article.destroy

		redirect_to root_path, status: :see_other
	end

	private
	
	def article_params
		params.require(:article).permit(:title, :body, :image)
	end

	def set_article
		@article = Article.find(params[:id])
	end

end
