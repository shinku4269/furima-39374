class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_charges
  belongs_to_active_hash :shipping_day

  validates :name,                presence: true
  validates :description,         presence: true
  validates :price,               presence: true, format: { with: /\A[0-9]+\z/ },
                                  numericality: { in: 300..9999999 }
  validates :category_id,         presence: true, numericality: { other_than: 1, message: "Category can't be blank" }
  validates :status_id,           presence: true, numericality: { other_than: 1, message: "Status can't be blank" }
  validates :shipping_area_id,    presence: true, numericality: { other_than: 1, message: "Shipping_area can't be blank" }
  validates :shipping_charges_id, presence: true, numericality: { other_than: 1, message: "Shipping_charges can't be blank" }
  validates :shipping_day_id,     presence: true, numericality: { other_than: 1, message: "Shipping_day can't be blank" }
end
