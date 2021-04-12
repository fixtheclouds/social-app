class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, as: :likeable, dependent: :delete_all
  has_many :comments, dependent: :destroy

  has_one_attached :image

  validates :body, presence: true
  validates :title, length: { maximum: 255 }
end
