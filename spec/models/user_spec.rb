require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'すべての値を正しく入力すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'nameが空では登録できない' do 
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end

      it 'last_name_katakanaが空では登録できない' do
        @user.last_name_katakana= ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name katakana can't be blank")
      end

      it 'name_katakanaが空では登録できない' do 
        @user.name_katakana= ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name katakana can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'emailでは@を含まないと登録できない' do
        @user.email = 'test.test'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'aaa'
        @user.password_confirmation = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password is too short (minimum is 6 characters)")
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it 'passwordが半角数字だけの場合登録できない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password には英字（半角）と数字（半角）の両方を含めて設定してください")
      end

      it 'passwordが半角英文字だけの場合登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password には英字（半角）と数字（半角）の両方を含めて設定してください")
      end

      it 'passwordが全角では登録できない' do
        @user.password = 'aaa１１１'
        @user.password_confirmation = 'aaa１１１'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password には英字（半角）と数字（半角）の両方を含めて設定してください")
      end

      it 'last_nameが半角英文字では登録できない' do
        @user.last_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name には、全角（漢字・ひらがな・カタカナ)で入力してください")
      end

      it 'last_nameが半角数字では登録できない' do
        @user.last_name = '111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name には、全角（漢字・ひらがな・カタカナ)で入力してください")
      end

      it 'nameが半角英文字では登録できない' do
        @user.name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name には、全角（漢字・ひらがな・カタカナ)で入力してください")
      end

      it 'nameが半角数字では登録できない' do
        @user.name = '111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name には、全角（漢字・ひらがな・カタカナ)で入力してください")
      end

      it 'last_name_katakanaが半角英文字では登録できない' do
        @user.last_name_katakana = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name katakana にはカタカナのみで入力してください")
      end

      it 'last_name_katakanaが半角数字では登録できない' do
        @user.last_name_katakana = '111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name katakana にはカタカナのみで入力してください")
      end

      it 'name_katakanaが英文字では登録できない' do
        @user.name_katakana = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name katakana にはカタカナのみで入力してください")
      end
    end
  end
end