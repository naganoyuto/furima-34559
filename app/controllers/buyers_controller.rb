class BuyersController < ApplicationController
  before_action :authenticate_user!
  before_action :sold_out_item, only: [:index]
  def index
    redirect_to root_path  if current_user.id == @item.user_id
    @buyer_shipping_address = BuyerShippingAddress.new
  end
  
  def create
      @item = Item.find(params[:item_id])
      @buyer_shipping_address = BuyerShippingAddress.new(buyer_params)
      if @buyer_shipping_address.valid?
        pay_item
        @buyer_shipping_address.save
        redirect_to root_path
      else
        render :index
      end
  end

  private
  def buyer_params
    params.require(:buyer_shipping_address).permit(:postal_code, :prefecture_id, :municipalities, :address, :builing_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: Item.find(params[:item_id]).price,
      card: buyer_params[:token],    
      currency: 'jpy'                 
    )
  end

  def sold_out_item
    @item = Item.find(params[:item_id])
    redirect_to root_path if @item.buyer.present?
  end
end
