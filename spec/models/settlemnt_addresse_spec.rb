require 'rails_helper'

RSpec.describe SettlemntAddresse, type: :model do
  describe '商品購入記録の保存' do
    before do
       @user = FactoryBot.create(:user)
       @product = FactoryBot.create(:product)
       @settlemnt= FactoryBot.build(:settlemnt_addresse, user_id: @user.id, product_id: @product.id)
       sleep(0.1)
    end

  context '内容に問題ない場合' do
    it 'すべての値が正しく入力されていれば購入できること' do
      expect(@settlemnt).to be_valid
    end
    it "tokenがあれば保存ができること" do
      expect(@settlemnt).to be_valid
    end
    it '建物名が空でも購入できること' do
      @settlemnt.build_name = ''
      expect(@settlemnt).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it "tokenが空では登録できないこと" do
      @settlemnt.token = nil
      @settlemnt.valid?
      expect(@settlemnt.errors.full_messages).to include("Token can't be blank")
    end

    it '郵便番号は空では保存できないこと' do
      @settlemnt.postal_code = ''
      @settlemnt.valid?
      expect(@settlemnt.errors.full_messages).to include("Postal code can't be blank")
    end
    it '郵便番号は『３桁ハイフン４桁』半角英数字でないと保存できないこと' do
      @settlemnt.postal_code = '123-123４'
      @settlemnt.valid?
      expect(@settlemnt.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end

    it '都道府県に「---」が選択されている場合は購入できないこと' do
      @settlemnt.prefecture_id = '---'
      @settlemnt.valid?
      expect(@settlemnt.errors.full_messages).to include("Prefecture can't be blank")
    end
    it '市区町村が空だと購入できないこと' do
      @settlemnt.city = nil
      @settlemnt.valid?
      expect(@settlemnt.errors.full_messages).to include("City can't be blank")
    end
    it '番地が空だと購入できないこと' do
      @settlemnt.address = nil
      @settlemnt.valid?
      expect(@settlemnt.errors.full_messages).to include("Address can't be blank")
    end
    it '電話番号が空だと購入できないこと' do
      @settlemnt.tell = nil
      @settlemnt.valid?
      expect(@settlemnt.errors.full_messages).to include("Tell can't be blank")
    end
    it '電話番号が9桁以下だと購入できないこと' do
      @settlemnt.tell = '090123456'
      @settlemnt.valid?
      expect(@settlemnt.errors.full_messages).to include("Tell is invalid")
    end
    it '電話番号が12桁以上だと購入できない' do
      @settlemnt.tell = '090123456789'
      @settlemnt.valid?
      expect(@settlemnt.errors.full_messages).to include("Tell is invalid")
    end
    it '電話番号が半角数値でないと購入できないこと' do
      @settlemnt.tell = '０9012341234'
      @settlemnt.valid?
      expect(@settlemnt.errors.full_messages).to include("Tell is invalid")
    end
    it 'tokenが空では購入できないこと' do
      @settlemnt.token = nil
      @settlemnt.valid?
      expect(@settlemnt.errors.full_messages).to include("Token can't be blank")
    end
    it 'user_idが紐づいていなければ購入できないこと' do
      @settlemnt.user_id = ''
      @settlemnt.valid?
      expect(@settlemnt.errors.full_messages).to include("User can't be blank")
    end
    it 'product_idが紐づいていなければ購入できないこと' do
      @settlemnt.product_id = nil
      @settlemnt.valid?
      expect(@settlemnt.errors.full_messages).to include("Product can't be blank")
    end
  end
end
end
