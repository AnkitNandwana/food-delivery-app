class Restaurant < ApplicationRecord
 has_many :food_items
 has_many :orders
end
