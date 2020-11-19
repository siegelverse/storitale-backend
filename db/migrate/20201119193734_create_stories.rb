class CreateStories < ActiveRecord::Migration[6.0]
  def change
    create_table :stories do |t|
      t.string :title
      t.text :body
      t.string :location
      t.integer :like_id
      t.integer :genre_id
      t.integer :user_id

      t.timestamps
    end
  end
end
