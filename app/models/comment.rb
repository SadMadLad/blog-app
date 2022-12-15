class Comment < ApplicationRecord
  has_many :replies, class_name: "Comment", foreign_key: "parent_id", dependent: :destroy
  belongs_to :parent, class_name: "Comment", optional: true
  has_many :likes, as: :likeable, dependent: :destroy
  
  belongs_to :article
  belongs_to :user

  validates :body, presence: true
end
