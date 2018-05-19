class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.integer :user_id
      t.string :user_name
      t.string :user_email
      t.string :user_address
      t.string :user_icon
      t.string :facebook
      t.string :twitter
      t.string :instagram
      t.string :professional
      t.text :skill
      t.text :hobby
      t.string :user_fb_msg
      t.string :password_digest
    end
  end
end
