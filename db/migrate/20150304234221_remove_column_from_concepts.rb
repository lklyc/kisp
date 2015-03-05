class RemoveColumnFromConcepts < ActiveRecord::Migration
  def change
    remove_column :concepts, :explanation
  end
end
