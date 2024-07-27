class CreateFoodItems < ActiveRecord::Migration[7.1]
  def change
    create_table :food_items do |t|
      t.integer :restaurant_id
      t.string :name
      t.decimal :price, precision: 20, scale: 2, default: 0.0
      t.string :image_path
      t.string :description
      t.timestamps
    end
  end
end
