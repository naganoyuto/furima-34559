class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname,null: false
  validates :birthday, null: false
  validates :last_name, null: false
  validates :name, null: false
  validates :last_name_katakana, null: false
  validates :name_katakana, null: false
end
