class ChangeColumnToArticle < ActiveRecord::Migration[6.0]
  def up
    change_column :articles, :body, :text
  end

  def down
    change_column :articles, :body, :string
  end
end
