class AddDisplayToOpinions < ActiveRecord::Migration
  def change
    add_column :opinions, :display, :string
  end
end
