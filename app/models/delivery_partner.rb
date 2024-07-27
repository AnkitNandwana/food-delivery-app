class DeliveryPartner < ApplicationRecord
  has_many :orders
  validates :contact, presence: true
  validates :contact, uniqueness: true
  validates :name, presence: true

end
