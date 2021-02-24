class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   
VALID_PASSWORD_REGEX = /\A[a-z\d]{6,}+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX}
  with_options presence: true do
    validates :nickname
    validates :birthday
    with_options format: { with: /\A[ぁ-んァ-ン一-龥]/} do
      validates :last_name
      validates :name
    end
    with_options format: { with: /\A[ァ-ヶー－]+\z/} do
      validates :last_name_katakana
      validates :name_katakana
    end
  end
end
