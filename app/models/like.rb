class Like < ApplicationRecord
  belongs_to :likeable, polymorphic: true
  belongs_to :user

  scope :count_likes, ->(likeable) {where(likeable: likeable).count}
end
