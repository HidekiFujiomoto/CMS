class AddContactImgToContacts < ActiveRecord::Migration[5.1]
  def change
    add_column :contacts, :contact_img, :string
  end
end
