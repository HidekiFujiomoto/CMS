class AddFavoriteUserToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :favorite_user, :string
  end
end
