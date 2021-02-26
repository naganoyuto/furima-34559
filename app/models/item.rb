class Item < ApplicationRecord
  belongs_to :user
  has_one :buyer
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  beiongs_to :condition
  beiongs_to :burden
  berongs_to :area
  berongs_to :day
end
