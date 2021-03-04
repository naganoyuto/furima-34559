require 'rails_helper'

RSpec.describe BuyerShippingAddress, type: :model do
    before do
        user = FactoryBot.create(:user)
        item = FactoryBot.create(:item)
        @buyer_shipping_address = FactoryBot.build(:buyer_shipping_address, user_id: user.id, item_id: item.id)
        sleep 0.1
    end

    describe '購入情報の保存' do
      context '購入情報の保存ができる場合' do
        it 'すべての値が正しく入力されていれば保存できる' do
          expect(@buyer_shipping_address).to be_valid
        end
      
      end
      context '購入情報の保存ができない場合' do
        it 'tokenが空だと保存できない' do
          @buyer_shipping_address.token = ''
          @buyer_shipping_address.valid?
          expect(@buyer_shipping_address.errors.full_messages).to include("Token can't be blank")
        end

        it 'postal_codeが空だと保存できない' do
          @buyer_shipping_address.postal_code = ''
          @buyer_shipping_address.valid?
          expect(@buyer_shipping_address.errors.full_messages).to include("Postal code can't be blank")
        end

        it 'municipalitiesが空だと保存できない' do
          @buyer_shipping_address.municipalities = ''
          @buyer_shipping_address.valid?
          expect(@buyer_shipping_address.errors.full_messages).to include("Municipalities can't be blank")
        end

        it 'addressが空だと保存できない' do
          @buyer_shipping_address.address = ''
          @buyer_shipping_address.valid?
          expect(@buyer_shipping_address.errors.full_messages).to include("Address can't be blank")
        end

        it 'phone_numberが空だと保存できない' do
          @buyer_shipping_address.phone_number = ''
          @buyer_shipping_address.valid?
          expect(@buyer_shipping_address.errors.full_messages).to include("Phone number can't be blank")
        end

        it 'postal_codeがハイフン無しだと保存できない' do
          @buyer_shipping_address.postal_code = '1234567'
          @buyer_shipping_address.valid?
          expect(@buyer_shipping_address.errors.full_messages).to include("Postal code ではハイフンありで入力してください")
        end

        it 'phone_numberが12桁以上だと保存できない' do
          @buyer_shipping_address.phone_number = '123456789012'
          @buyer_shipping_address.valid?
          expect(@buyer_shipping_address.errors.full_messages).to include("Phone number では11桁以内で入力してください")
        end 

        it 'phone_numberが全角文字だと保存できない' do
          @buyer_shipping_address.phone_number = 'ああああああ'
          @buyer_shipping_address.valid?
          expect(@buyer_shipping_address.errors.full_messages).to include("Phone number では数値で入力してください")
        end  
        
        it 'phone_numberが全数字だと保存できない' do
          @buyer_shipping_address.phone_number = '１１１１１１'
          @buyer_shipping_address.valid?
          expect(@buyer_shipping_address.errors.full_messages).to include("Phone number では数値で入力してください")
        end 
        
        it 'ユーザーが紐付いていなければ保存できない' do
          @buyer_shipping_address.user_id= ""
          @buyer_shipping_address.valid?
          expect(@buyer_shipping_address.errors.full_messages).to include("User can't be blank")
        end 

        it '商品がが紐付いていなければ保存できない' do
          @buyer_shipping_address.item_id = ""
          @buyer_shipping_address.valid?
          expect(@buyer_shipping_address.errors.full_messages).to include("Item can't be blank")
        end 

      end
    end
 end
