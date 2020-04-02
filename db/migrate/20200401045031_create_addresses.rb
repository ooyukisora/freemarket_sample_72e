class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|

      t.string :first_name,  null: false
      t.string :last_name,  null: false
      t.string :first_name_kana,  null: false
      t.string :last_name_kana,  null: false
      t.integer :postal, null: false
      t.string :prefecture, null: false
      t.string :municipality, null: false
      t.string :address, null: false
      t.string :discription
      t.integer :phone_number
      t.references :user

      t.timestamps
    end
  end
end
