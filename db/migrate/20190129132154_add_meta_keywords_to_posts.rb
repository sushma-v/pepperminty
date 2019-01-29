class AddMetaKeywordsToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :meta_keywords, :string
  end
end
