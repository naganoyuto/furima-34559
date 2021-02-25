class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  with_options presence: true do
    validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字（半角）と数字（半角）の両方を含めて設定してください'
    validates :nickname
    validates :birthday
    with_options format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: 'には、全角（漢字・ひらがな・カタカナ)で入力してください'} do
      validates :last_name
      validates :name
    end
    with_options format: { with: /\A[ァ-ヶー－]+\z/, message: 'にはカタカナのみで入力してください'} do
      validates :last_name_katakana
      validates :name_katakana
    end

  end
end
