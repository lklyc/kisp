class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :who
      t.string :what
      t.string :when
      t.string :where
      t.string :how
      t.integer :category_id
      t.integer :user_id
      t.timestamps
    end
  end
end
