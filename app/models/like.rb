class Like < ApplicationRecord
  belongs_to :user
  belongs_to :likeable, polymorphic: true

  validate :uniqueness, scope: %i[user_id likeable_type likeable_type]
end
