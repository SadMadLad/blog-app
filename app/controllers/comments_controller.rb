class CommentsController < ApplicationController
    def create
        @article = Article.find(params[:article_id])
        @comment = @article.comments.new(comment_params)
        @comment.user_id = current_user.id if current_user
        @comment.save

        redirect_to @article        
    end

    def edit
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
    end

    def update
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])

        if @comment.update(comment_params)
            redirect_to @article
        else
            render :edit, status: :unprocessable_entity
        end

    end
    
    def destroy
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
        @comment.destroy

        redirect_to @article
    end

    private
    def comment_params
        params.require(:comment).permit(:body, :user_id)
    end
end
