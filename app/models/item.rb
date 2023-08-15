class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :purchase, dependent: :destroy 

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_charges
  belongs_to_active_hash :shipping_day

  validates :name,                presence: true
  validates :description,         presence: true
  validates :price,               presence: true, format: { with: /\A[0-9]+\z/ },
                                  numericality: { only_integer: true, greater_than: 299, less_than: 10000000 }
  validates :category_id,         presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :status_id,           presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_area_id,    presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_charges_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_day_id,     presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :image,               attached: true
end
