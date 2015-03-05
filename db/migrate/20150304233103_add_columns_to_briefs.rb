class AddColumnsToBriefs < ActiveRecord::Migration
  def change
    add_column :briefs, :briefable_type, :string
    add_column :briefs, :briefable_id, :integer
  end
end
