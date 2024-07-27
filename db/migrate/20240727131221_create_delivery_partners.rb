class CreateDeliveryPartners < ActiveRecord::Migration[7.1]
  def change
    create_table :delivery_partners do |t|
      t.integer :order_id
      t.string :name
      t.string :password
      t.string :city
      t.text :address
      t.string :contact
      t.timestamps
    end
  end
end