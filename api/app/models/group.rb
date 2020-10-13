class Group < ApplicationRecord
    belongs_to :user
    belongs_to :fes_year
    belongs_to :group_category
    has_one :stage_common_option
    has_many :power_orders
    has_one :sub_rep
    has_many :employees
    has_one :place_order
end