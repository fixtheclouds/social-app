class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, as: :likeable, dependent: :delete_all
  has_many :comments, dependent: :destroy

  validates :body, presence: true
  validates :title, length: { maximum: 255 }
end
