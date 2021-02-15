class CreateFollows < ActiveRecord::Migration[6.1]
  def change
    create_table :follows do |t|
      t.references :user, foreign_key: true, null: false
      t.references :follower, foreign_key: { to_table: :users }, null: false

      t.datetime :created_at, null: false
    end
  end
end
