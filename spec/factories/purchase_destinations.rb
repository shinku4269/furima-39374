FactoryBot.define do
  factory :purchase_destination do
    post_code            {Faker::Number.between(from: 100, to: 999).to_s + "-" + Faker::Number.between(from: 1000, to: 9999).to_s }
    shipping_area_id     {Faker::Number.between(from: 2, to: 48)}
    city                 {Faker::Address.city}
    address              {Faker::Address.street_address}
    building_name        {Faker::Address.building_number}
    phone_number         {Faker::Number.between(from: 1000000000, to: 99999999999).to_s}
    token                {"tok_abcdefghijk00000000000000000"}
  end
end

