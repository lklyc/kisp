class AddAuthorPublisherToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :author, :string
    add_column :articles, :published_on, :string
  end
end
