class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.integer :user_id
      t.string :user_name
      t.text :contact_content
      t.integer :contact_user_id
      t.string :contact_user_name
      t.string :contact_user_email
      t.string :contact_user_fbmsg
    end
  end
end
