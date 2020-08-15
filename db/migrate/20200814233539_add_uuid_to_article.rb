class AddUuidToArticle < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :uuid, :string
  end
end
