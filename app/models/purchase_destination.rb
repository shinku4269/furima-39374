class PurchaseDestination
  include ActiveModel::Model
  attr_accessor :post_code, :shipping_area_id, :city, :address, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :post_code,        format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :shipping_area_id, numericality: { other_than: 1, message: "を入力してください" }
    validates :city
    validates :address
    validates :phone_number,     format: {with: /\A[0-9]+\z/}, length: { minimum: 10, maximum: 11 }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Destination.create(post_code: post_code, shipping_area_id: shipping_area_id, city: city, address: address, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)

  end
end