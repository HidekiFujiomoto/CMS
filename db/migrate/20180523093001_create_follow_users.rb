class CreateFollowUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :follow_users do |t|
      t.integer :to_user_id
      t.integer :from_user_id
    end
  end
end
