module ArticlesHelper
  def likeable_likes(likeable)
    likeable.likes.count
  end

  def user_likes_likeable?(likeable)
    current_user.likes.exists?(likeable: likeable)
  end

  def liked_likeable(likeable)
    current_user.likes.find_by(likeable: likeable)
  end
end
