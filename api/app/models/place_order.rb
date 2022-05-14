class PlaceOrder < ApplicationRecord
    belongs_to :group
    has_one :assign_group_place, dependent: :destroy

    def self.get_with_groups
      @record = PlaceOrder.preload(:group)
        .map{
          |place_order|
          {
            "place_order": place_order,
            "place_order_name": place_order.to_place_name_h,
            "group": place_order.group
          }
        }
    end

    def self.get_with_group(place_order_id)
      place_order = PlaceOrder.find(place_order_id)
      return {
        "place_order": place_order,
        "place_order_name": place_order.to_place_name_h,
        "group": place_order.group
      }
    end

    # 会場申請を会場名のハッシュにして返す
    def to_place_name_h
      @places = Place.all
      return { 
        "place_order": self.nil? ? nil : self,
        "first": self.first.nil? ? nil : @places[self.first-1].name,
        "second": self.second.nil? ? nil : @places[self.second-1].name,
        "third": self.third.nil? ? nil : @places[self.third-1].name,
        "remark": self.remark.nil? ? nil : self.remark
      }
    end

end
