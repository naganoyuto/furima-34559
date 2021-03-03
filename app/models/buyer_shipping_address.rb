class BuyerShippingAddress
  include ActiveModel: :Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :municipalities, :address, :builing_name, :phone_number

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, numericality: {with: /\A\d{3}[-]\d{4}\z/, message: "ではハイフンアリで入力してください"}
    validates :prefecture_id
   validates :municipalities
    validates :address
    validates :phone_number, numericality: {with: /\A\d{10,11}\z/, message: "では11桁以内の数値のみで入力してください"}
  end


  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, municipalities: municipalities, address: address, builing_name: builing_name, phone_number: phone_number, buyer_id: buyer.id )
 end
end