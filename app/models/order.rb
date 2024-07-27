class Order < ApplicationRecord
	belongs_to :user
	belongs_to :restaurant
	belongs_to :delivery_partner
end
