class CommentsController < ApplicationController
  before_action :set_article_and_comment, only: [:edit, :update, :destroy]
  before_action :set_article, only: [:create, :reply]

  def create
    @comment = @article.comments.new(comment_params)
    @comment.save

    flash[:notice] = "New Comment Added"
    redirect_to @article
  end

  def edit
    flash[:notice] = "Comment Edited Successfully"
  end

  def reply
    @parent_comment = @article.comments.find(params[:comment_id])
    @reply = Comment.new(article_id: @article, parent_id: @parent_comment)
  end

  def update
    if @comment.update(comment_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    flash[:notice] = "Comment deleted successfully"
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
    authorize @comment
  end

  def set_article
    @article = Article.find(params[:article_id])
  end
end
