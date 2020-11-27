class CreateStories < ActiveRecord::Migration[6.0]
  def change
    create_table :stories do |t|
      t.string :title
      t.text :body
      t.integer :favorites_count
      t.integer :user_id

      t.timestamps
    end
  end
end
