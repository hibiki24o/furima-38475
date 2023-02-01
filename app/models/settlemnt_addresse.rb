class SettlemntAddresse
  include ActiveModel::Model
  attr_accessor :image, :postal_code, :prefecture_id, :city, :address, :house_number, :build_name, :tell, :user_id, :day, :product_id, :price, :token

  with_options presence: true do
    validates :token
    validates :user_id
    validates :product_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :address,         presence: true
    validates :city,            presence: true
    validates :tell,            format: {with: /\A\d{10,11}\z/} 
  end

  def save
    # 決済情報を保存し、変数settlemntに代入する
    settlemnt = Settlemnt.create(product_id: product_id , user_id: user_id)
    # 住所を保存する
    # product_idには、変数productのidと指定する
    ShippingAddresse.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, build_name: build_name, tell: tell,  settlemnt_id: settlemnt.id)
  end
  


end