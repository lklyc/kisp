class CreateConcepts < ActiveRecord::Migration
  def change
    create_table :concepts do |t|
      t.string :concept
      t.string :context
      t.string :explanation
      t.integer :user_id
      t.integer :category_id
      t.timestamps
    end
  end
end
