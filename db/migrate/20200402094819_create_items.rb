class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.string :text, null: false
      t.string :status, null: false
      t.string :delivery_fee, null: false
      t.string :from_area, null: false
      t.string :shipping_day, null: false
      t.references :user
      t.references :category
      t.references :buyer
      # t.string :brand
      # t.string :size 
      t.timestamps
    end
  end
end
