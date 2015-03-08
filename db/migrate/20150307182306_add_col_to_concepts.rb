class AddColToConcepts < ActiveRecord::Migration
  def change
    add_column :concepts, :display, :string
  end
end
