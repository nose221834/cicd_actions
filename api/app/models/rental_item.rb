class RentalItem < ApplicationRecord
    has_many :rental_item_allow_lists
    has_many :rental_orders
    has_many :stocker_items
end
