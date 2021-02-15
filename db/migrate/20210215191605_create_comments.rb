class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :body

      t.references :user, foreign_key: true

      t.datetime :deleted_at
      t.timestamps null: false
    end
  end
end
