class CreateSearchs < ActiveRecord::Migration[5.1]
  def change
    create_table :searchs do |t|
      t.string :name
      t.string :email
      t.string :address
      t.string :professional
      t.text :skill
      t.text :hobby
      t.string :facebook
    end
  end
end
