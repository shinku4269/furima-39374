class Item < ApplicationRecord
  

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_charges
  belongs_to_active_hash :shipping_day

  
  validates :category_id         { other_than: 1, message: "Category can't be blank" }
  validates :status_id           { other_than: 1, message: "Status can't be blank" }
  validates :shipping_area_id    { other_than: 1, message: "Shipping_area can't be blank" }
  validates :shipping_charges_id { other_than: 1, message: "Shipping_chages can't be blank" }
  validates :shipping_day_id     { other_than: 1, message: "Shipping_day can't be blank" }
end
