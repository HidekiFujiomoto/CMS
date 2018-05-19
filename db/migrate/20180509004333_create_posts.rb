class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.integer :post_id
      t.string :post_title
      t.text :post_content
      t.string :post_image_1
      t.string :post_image_2
      t.string :post_image_3
      t.string :post_user_name
    end
  end
end
