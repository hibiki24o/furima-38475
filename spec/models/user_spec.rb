require 'rails_helper'

RSpec.describe User, type: :model do  
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザーの新規登録ができる' do
  it 'すべてのユーザー情報が存在すれば登録できる' do
    expect(@user).to be_valid
   end
  end
     context 'ユーザーの新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'メールアドレスが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")  
      end
      it '重複したメールアドレスは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'メールアドレスに@を含まない場合は登録できない' do
        @user.email = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'パスワードが空では登録できない' do
       @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")  
      end 
      it 'パスワードが6文字未満では登録できない' do
        @user.password = 'aaaaa'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')  
      end
      it '英字のみのパスワードでは登録できない' do
        @user.password = 'abcdefg'
        @user.password_confirmation = 'abcdefg'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid") 
      end
      it '数字のみのパスワードでは登録できない' do
        @user.password = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")  
      end
      it '全角文字を含むパスワードでは登録できない' do
        @user.password = 'kmctwqkq' #全角での入力です
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid") 
      end
      it 'パスワードとパスワード（確認用）が不一致だと登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '姓（全角）が空だと登録できない' do
        @user.fast_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Fast name 全角文字を使用してください")  
      end
      it '姓（全角）に半角文字が含まれていると登録できない' do
        @user.fast_name = 'ｱｲｳｴｵ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Fast name 全角文字を使用してください")  
      end
      it '名（全角）が空だと登録できない' do
        @user.middle_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Middle name can't be blank")  
      end
      it '名（全角）に半角文字が含まれていると登録できない' do
        @user.middle_name = 'ｱｲｳｴｵ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Middle name 全角文字を使用してください")  
      end
      it '姓（カナ）が空だと登録できない' do
        @user.fast_kana_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Fast kana name can't be blank")  
      end
      it '姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.fast_kana_name = "@"
        @user.valid?
        expect(@user.errors.full_messages).to include("Fast kana name 全角文字を使用してください") 
      end
      it '名（カナ）が空だと登録できない' do
        @user.middle_kana_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Middle kana name can't be blank")  
      end
      it '名（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.middle_kana_name = "tarou"
        @user.valid?
        expect(@user.errors.full_messages).to include("Middle kana name 全角文字を使用してください")  
      end
      it '生年月日が空だと登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")  
      end
    end
end
