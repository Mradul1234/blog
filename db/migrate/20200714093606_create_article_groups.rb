class CreateArticleGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :article_groups do |t|
      t.integer :article_id
      t.integer :group_id
    end
  end
end
