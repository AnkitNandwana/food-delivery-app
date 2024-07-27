class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :restaurant_id
      t.string :food_item_ids
      t.date :date
      t.text :delivery_partner_id
      t.string :status
      t.decimal :amount, precision: 20, scale: 2, default: 0.0
      t.timestamps
    end
  end
end
