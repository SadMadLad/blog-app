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

        authorize @comment
    end

    def reply
       @article = Article.find(params[:article_id])
       @parent_comment = @article.comments.find(params[:comment_id])
       @reply = Comment.new(article_id: @article, parent_id: @parent_comment)
    end

    def update
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])

        authorize @comment

        if @comment.update(comment_params)
            redirect_to @article
        else
            render :edit, status: :unprocessable_entity
        end

    end
    
    def destroy
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])

        authorize @comment
        @comment.destroy

        redirect_to @article
    end

    private
    def comment_params
        params.require(:comment).permit(:body, :user_id, :parent_id)
    end
end
