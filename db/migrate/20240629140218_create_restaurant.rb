class CreateRestaurant < ActiveRecord::Migration[7.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :email
      t.string :password, :digest
      t.string :city
      t.text :address
      t.string :contact
      t.timestamps
    end
  end
end
