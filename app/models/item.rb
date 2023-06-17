class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_categor
  belongs_to :item_sales_status
  belongs_to :item_shipping_fee_status
  belongs_to :item_prefecture
  belongs_to :item_scheduled_delivery

  validates :image, presence: true
  validates :item_name, presence: true
  validates :item_info, presence: true
  validates :item_category_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :item_sales_status_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :item_shipping_fee_status_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :item_prefecture_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :item_scheduled_delivery_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :item_price, presence: true, numericality: { only_integer: true }
end
