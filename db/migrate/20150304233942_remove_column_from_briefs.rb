class RemoveColumnFromBriefs < ActiveRecord::Migration
  def change
    remove_column :briefs, :article_id
  end
end
