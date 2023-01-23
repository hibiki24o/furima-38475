class SettlementAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :city, :house_number, :building_name, :tell, :user_id, :day, :product_id, :price

  with_options presence: true do
    validates :user_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
    validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}
    validates :city,            presence: true
    validates :house_number,    presence: true
    validates :tell,            presence: true


  def save
    # 決済情報を保存し、変数settlemntに代入する
    settlemnt = Settlemnt.create(price: price, user_id: user_id)
    # 住所を保存する
    # product_idには、変数productのidと指定する
    Address.create(postal_code: postal_code, prefecture: prefecture, city: city, house_number: house_number, building_name: building_name, product_id: product.id)
  end
  


end