module ArticlesHelper
  def likes_count(likeable)
    likeable.likes.count
  end

  def is_liked(likeable)
    current_user.likes.find_by(likeable: likeable)
  end
end
