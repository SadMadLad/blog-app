class LikesController < ApplicationController
  def create
    @like = current_user.likes.new(like_params)
    # p "Killme #{like_params[:likeable_type]}"
    @like.save

    if like_params[:likeable_type] == "Comment"
      redirect_to @like.likeable.article
    else
      redirect_to root_path
    end
  end

  def destroy
    @like = current_user.likes.find(params[:id])
    likeable = @like.likeable
    @like.destroy

    if likeable.class.name == "Comment"
      redirect_to likeable.article
    else
      redirect_to root_path
    end
  end

  private
  def like_params
    params.require(:like).permit(:likeable_type, :likeable_id)
  end
end
