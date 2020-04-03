class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :price
      t.string :text
      # t.string :brand
      t.string :size
      t.string :status
      t.string :delivery_fee
      t.string :shipping_day
      t.references :user
      # t.references :category
      # t.references :address
      # t.references :image
      # t.references :buyer

      t.timestamps
    end
  end
end
