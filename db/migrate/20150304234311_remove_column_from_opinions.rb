class RemoveColumnFromOpinions < ActiveRecord::Migration
  def change
    remove_column :opinions, :explanation
  end
end
