require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  context '商品の出品ができるとき' do
    it 'すべての出品情報が存在すれば登録できる' do
    expect(@product).to be_valid
   end
  it "priceが300ちょうどだと登録できる" do
    @product.price = "300"
    expect(@product).to be_valid
  end
end

  context '商品の出品ができないとき' do
    it ' 商品画像が空では登録できない' do
      @product.image = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Image can't be blank")
    end
    it '商品名が空では登録できない' do
      @product.title = ''
      @product.valid?
      expect(@product.errors.full_messages).to include("Title can't be blank")  
    end
    it '商品説明が空では登録できない' do
      @product.explanation = ''
      @product.valid?
      expect(@product.errors.full_messages).to include("Explanation can't be blank")  
    end
    it 'カテゴリーの選択が「---」は登録できない' do
      @product.category_id = '---'
      @product.valid?
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
    it '商品状態の選択が「---」の時は出品できない' do
      @product.status_id = '---'
      @product.valid?
      expect(@product.errors.full_messages).to include("Status can't be blank")
    end
    it '配送手数料の選択が「---」の時は出品できない' do
      @product.delivery_charge_id = '---'
      @product.valid?
      expect(@product.errors.full_messages).to include("Delivery charge can't be blank")  
    end 
    it '配送元の選択が「---」の時は出品できない' do
      @product.prefecture_id = '---'
      @product.valid?
      expect(@product.errors.full_messages).to include("Prefecture can't be blank")  
    end
    it '発送まで日数の選択が「---」の時は出品できない' do
      @product.scheduled_day_id = '---'
      @product.valid?
      expect(@product.errors.full_messages).to include( "Scheduled day can't be blank") 
    end
    it '商品の価格の設定が空では出品できない' do
      @product.price = ''
      @product.valid?
      expect(@product.errors.full_messages).to include("Price is invalid")  
    end
    it "priceが299以下だと登録できないこと" do
      @product.price = "299"
      @product.valid?
      expect(@product.errors.full_messages).to include("Price must be greater than or equal to 300")
    end
    it "価格に半角数字以外が含まれている場合は出品できない" do
      @product.price = ''
      @product.valid?
      expect(@product.errors.full_messages).to include( "Price is not a number")
    end
    it "価格が9_999_999円を超えると出品できない" do
      @product.price = "10000000"
      @product.valid?
      expect(@product.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end
    it 'userが紐付いていなければ出品できない' do
       @product.user = nil
       @product.valid?
       expect(@product.errors.full_messages).to include("User must exist")
    end
  end
end

