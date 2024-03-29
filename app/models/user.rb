class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname,            presence: true
         validates :fast_name,           presence: true,format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' }
         validates :middle_name,         presence: true,format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' }
         validates :fast_kana_name,      presence: true,format: { with: /\A[ァ-ヶー]+\z/, message: '全角文字を使用してください' }
         validates :middle_kana_name,    presence: true,format: { with: /\A[ァ-ヶー]+\z/, message: '全角文字を使用してください' }
         validates :birth_date,          presence: true

         has_many :products

         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates_format_of :password, with: PASSWORD_REGEX
end
