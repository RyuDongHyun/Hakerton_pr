class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :content
      t.string :image
      t.integer :crew_id

      t.timestamps null: false
    end
  end
end