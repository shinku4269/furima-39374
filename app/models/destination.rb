class Destination < ApplicationRecord
  belongs_to :purchase
  

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shipping_area

  validates :post_code,        presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
  validates :shipping_area_id, presence: true, numericality: { other_than: 1 }
  validates :city,             presence: true
  validates :address,          presence: true
  validates :building_name,    presence: true
  validates :phone_number,     presence: true,format: {with: /\A[0-9]+\z/}, length:  {minimum: 10, maximum: 11 }
  
end
