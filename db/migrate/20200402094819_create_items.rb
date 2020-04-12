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
      t.references :user, null: false
      t.references :category, null: false
      t.references :buyer, null: false
      # t.string :brand
      # t.string :size 
      t.timestamps
    end
  end
end
