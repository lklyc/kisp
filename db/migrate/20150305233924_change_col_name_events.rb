class ChangeColNameEvents < ActiveRecord::Migration
  def change
    rename_column :events, :how, :why
  end
end
