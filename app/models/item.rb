class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_cost
  belongs_to :todouhuken
  belongs_to :send_schedule

  be_longs_to :user
end
