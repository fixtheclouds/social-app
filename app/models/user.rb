class User < ApplicationRecord
  has_secure_password

  has_many :followers, through: :follow, source: :user
  has_many :followings, through: :follow, source: :follower
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
end
