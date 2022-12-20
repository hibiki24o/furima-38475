class Product < ApplicationRecord

  validates :title,              presence: true
  validates :user,               presence: true
  validates :explanation,        presence: true
  validates :category_id,        presence: true
  validates :status_id,          presence: true
  validates :delivery_charge_id, presence: true
  validates :prefecture_id,      presence: true
  validates :scheduled_day_id,   presence: true
  validates :price,              presence: true
end
