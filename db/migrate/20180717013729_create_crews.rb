class CreateCrews < ActiveRecord::Migration
  def change
    create_table :crews do |t|
      t.string :title
      t.string :desc
      t.string :image
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
