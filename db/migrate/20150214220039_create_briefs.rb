class CreateBriefs < ActiveRecord::Migration
  def change
    create_table :briefs do |t|
      t.text :body
      t.integer :user_id
      t.integer :article_id
      t.timestamps
    end
  end
end
