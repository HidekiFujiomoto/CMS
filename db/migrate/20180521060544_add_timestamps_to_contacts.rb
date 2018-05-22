class AddTimestampsToContacts < ActiveRecord::Migration[5.1]
  def change
    add_column :contacts, :timestamps, :text
  end
end
