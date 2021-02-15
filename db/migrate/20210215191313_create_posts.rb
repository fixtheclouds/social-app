class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body, null: false

      t.references :user, foreign_key: true, index: true, null: false
      t.references :parent, foreign_key: { to_table: :posts }, index: true, null: false

      t.datetime :deleted_at
      t.timestamps null: false
    end
  end
end
