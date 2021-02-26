class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :burden
  belongs_to :area
  belongs_to :day
  belongs_to :user
  has_one :buyer
  has_one_attached :image
  #VALID_PRICEL_REGEX =  /\A[0-9]+\z/
  with_options presence: true do
    validates :image
    validates :title 
    validates :text
   # validates :price, format: {with: VALID_PRICEL_REGEX, message: 'には半角数字で入力してください'}
    validates :price, numericality: { only_integer: true, greater_than: 300, less_than: 9999999, message: 'には¥300~¥9,999,999かつ半角数字で入力してください'}
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :condition_id
      validates :burden_id
      validates :area_id
      validates :day_id
   end
  end
end
