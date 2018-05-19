class AddIndexToUsersEmail < ActiveRecord::Migration[5.1]
  def change
    add_index :users, :user_email, unique: true
  end
end
