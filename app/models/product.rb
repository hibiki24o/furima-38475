class Product < ApplicationRecord

   validates :title,              presence: true #商品名
   validates :explanation,        presence: true #商品説明
   validates :category_id,        presence: true #カテゴリー
   validates :status_id,          presence: true #商品状態
   validates :delivery_charge_id, presence: true #配送手数料 
   validates :prefecture_id,      presence: true #配送先
   validates :scheduled_day_id,   presence: true #配送予定日

   with_options presence: true, format: { with: /\A[0-9]+\z/} do
   validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}, 
   presence: {message: "can't be blank"} #商品価格
   end

   has_one_attached :image
   validates :image,              presence: true
   belongs_to :user

   #ジャンルの選択が「---」の時は保存できないようにする
   validates :category_id, :delivery_charge_id, :prefecture_id, :scheduled_day_id, :status_id, numericality: { other_than: 1 , message: "can't be blank"}

   extend ActiveHash::Associations::ActiveRecordExtensions
   belongs_to :category
   belongs_to :status
   belongs_to :delivery_charge
   belongs_to :prefecture
   belongs_to :scheduled_day
end
