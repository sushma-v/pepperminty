class ChangeValidationsInPosts < ActiveRecord::Migration[5.1]
  def change
    change_column_null :posts, :title, false
    change_column_null :posts, :content, false
    change_column_null :posts, :category, false
    change_column_null :posts, :author, false
  end
end
