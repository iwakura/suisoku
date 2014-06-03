class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.references :user, index: true, null: false, default: 0
      t.integer    :listing_id, null: false, default: 0
      t.boolean    :successful, null: false, default: false
      t.timestamp  :created_at
    end
  end
end
