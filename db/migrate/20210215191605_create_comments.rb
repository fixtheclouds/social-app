class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :body

      t.references :post, foreign_key: true, null: false
      t.references :user, foreign_key: true
      t.references :parent, foreign_key: { to_table: :comments }

      t.datetime :deleted_at
      t.timestamps null: false
    end
  end
end
