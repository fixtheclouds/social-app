class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.references :user, foreign_key: true, null: false
      t.references :likeable, polymorphic: true, index: true, null: false

      t.datetime :created_at, null: false
    end
  end
end
