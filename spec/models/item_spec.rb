require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '商品出品できる場合' do
      it 'すべての入力が正しければ出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品できない場合' do
      it '画像が空では出品できない' do
        @item.image = nil
        @item.valid?
       expect(@item.errors.full_messages).to include("Image can't be blank")
      end  

      it '商品名が空では登録できない' do
        @item.title = ''
        @item.valid?
       expect(@item.errors.full_messages).to include("Title can't be blank")
      end  

      it '商品の説明が空では登録できない' do
        @item.text = ''
        @item.valid?
       expect(@item.errors.full_messages).to include("Text can't be blank")
      end  

      it 'カテゴリーが1では登録できない' do
        @item.category_id= '1'
        @item.valid?
       expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it '商品の状態が1では登録できない' do
        @item.condition_id = '1'
        @item.valid?
       expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end
      
      it '発送料の負担が1では登録できない' do
        @item.burden_id = '1'
        @item.valid?
       expect(@item.errors.full_messages).to include("Burden must be other than 1")
      end

      it '発送元の地域が1では登録できない' do
        @item.area_id = '1'
        @item.valid?
       expect(@item.errors.full_messages).to include("Area must be other than 1")
      end

      it '発送までの日数が1では登録できない' do
        @item.day_id  = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Day must be other than 1")
      end

      it '販売価格が空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '販売価格が全角数字では登録できない' do
        @item.price = '１２３４'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price には¥300~¥9,999,999かつ半角数字で入力してください")
      end

      it '販売価格が半角英数字混合では登録できない' do
        @item.price = '188ddd'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price には¥300~¥9,999,999かつ半角数字で入力してください")
      end

      it '販売価格が半角英字のみでは登録できない' do
        @item.price = 'ddddd'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price には¥300~¥9,999,999かつ半角数字で入力してください")
      end

      it '販売価格が299円以下では登録できない' do
        @item.price ='299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price には¥300~¥9,999,999かつ半角数字で入力してください")
      end

      it '販売価格が10000000では登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price には¥300~¥9,999,999かつ半角数字で入力してください")
      end


      it 'ユーザーが紐付いていなければ投稿できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end