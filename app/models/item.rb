class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :item_name, presence: true
  validates :item_text, presence: true
  validates :price, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :delivery_cost_id, presence: true
  validates :todouhuken_id, presence: true
  validates :send_schedule_id, presence: true


  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_cost
  belongs_to :todouhuken
  belongs_to :send_schedule
 # has_one attached :image
end
