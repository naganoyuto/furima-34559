FactoryBot.define do
  factory :buyer_shipping_address do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code {'123-4567'}
    prefecture_id {1}
    municipalities {"小林市"}
    address {"青山1-1-1"}
    builing_name {"柳ビル103"}
    phone_number{"09033334444"}
  end
end
