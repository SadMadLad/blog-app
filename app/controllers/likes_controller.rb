class LikesController < ApplicationController
  def create
    @like = current_user.likes.new(like_params)
    p "Killme #{like_params}"
    @like.save

    redirect_to @like.likeable
  end

  def destroy
    @like = current_user.likes.find(params[:id])
    likeable = @like.likeable
    @like.destroy
    redirect_to likeable
  end

  private
  def like_params
    params.require(:like).permit(:likeable_type, :likeable_id)
  end
end
