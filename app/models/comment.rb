class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  belongs_to :parent, optional: true
  has_many :likes, as: :likeable, dependent: :delete_all

  validates :body, presence: true
end
