class CommentsController < ApplicationController
  before_action :set_article_and_comment, only: [:edit, :update, :destroy]

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(comment_params)
    @comment.user_id = current_user.id if current_user
    @comment.save

    redirect_to @article        
  end

  def edit
    authorize @comment
  end

  def reply
    @article = Article.find(params[:article_id])
    @parent_comment = @article.comments.find(params[:comment_id])
    @reply = Comment.new(article_id: @article, parent_id: @parent_comment)
  end

  def update
    authorize @comment
    if @comment.update(comment_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
      authorize @comment
      @comment.destroy
      redirect_to @article
  end

  private
  
  def comment_params
      params.require(:comment).permit(:body, :user_id, :parent_id)
  end
  
  def set_article_and_comment
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
  end
end
