class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :authors
      t.string :thumbnail
      t.string :category
      t.string :contents
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
