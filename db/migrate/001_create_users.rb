class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :email,           null: false, default: '', limit: 40
      t.string  :password_digest, null: false, default: '', limit: 60
      t.boolean :admin,           null: false, default: false
      t.timestamps
    end
    add_index :users, :email
  end
end
