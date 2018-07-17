class CreateRolls < ActiveRecord::Migration
  def change
    create_table :rolls do |t|
      t.string :is_signed?
      t.references :crew, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
