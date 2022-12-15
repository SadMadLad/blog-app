class CommentsController < ApplicationController
  before_action :set_article_and_comment, only: [:edit, :update, :destroy]
  before_action :set_article, only: [:create, :reply]

  def create
    @comment = @article.comments.build(comment_params)
    if @comment.save
      redirect_to @article, notice: 'Comment created successfully'
    end
  end

  def edit
  end

  def reply
    @parent_comment = @article.comments.find(params[:comment_id])
    @reply = Comment.new(article_id: @article, parent_id: @parent_comment)
  end

  def update
    if @comment.update(comment_params)
      redirect_to @article, notice: "Comment Edited Successfully"
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    @comment.destroy
    flash[:notice] = "Comment deleted successfully"
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
