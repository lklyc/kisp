class AddDisplayToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :display, :string
  end
end
