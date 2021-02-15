class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :email, null: false
      t.string :full_name, null: false
      t.string :encrypted_password

      t.datetime :last_sign_in_at
      t.datetime :deleted_at
      t.timestamps null: false
    end
  end
end
