class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  has_one_attached :image, dependent: :destroy
  belongs_to :user


  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
