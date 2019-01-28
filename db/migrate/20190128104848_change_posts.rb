class ChangePosts < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :thumb_image
    change_column :posts, :main_image, :string
    add_column :posts, :alt_text, :string
  end
end
