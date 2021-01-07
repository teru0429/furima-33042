class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery

  #空の投稿を保存できないようにする
  validates_presence_of :name, :info, :price, :image

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id,            numericality: { other_than: 1 } 
  validates :sales_status_id,        numericality: { other_than: 1 } 
  validates :shipping_fee_status_id, numericality: { other_than: 1 } 
  validates :prefecture_id,          numericality: { other_than: 1 } 
  validates :scheduled_delivery_id,  numericality: { other_than: 1 } 

  #価格
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Out of setting range"}
  validates :price, numericality: { only_integer: true, message: "Half-width number." }
end
