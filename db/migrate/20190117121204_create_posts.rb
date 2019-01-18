class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.text :thumb_image
      t.text :main_image
      t.string :category
      t.string :author
      t.integer :status, default:0

      t.timestamps
    end
  end
end
