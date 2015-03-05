class CreateOpinions < ActiveRecord::Migration
  def change
    create_table :opinions do |t|
      t.string :x
      t.string :y
      t.string :explanation
      t.integer :user_id
      t.integer :category_id
      t.timestamps
    end
  end
end
