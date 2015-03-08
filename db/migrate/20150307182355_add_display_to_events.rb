class AddDisplayToEvents < ActiveRecord::Migration
  def change
    add_column :events, :display, :string
  end
end
