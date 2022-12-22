class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname,            presence: true
         validates :fast_name,           presence: true
         validates :middle_name,         presence: true
         validates :fast_kana_name,      presence: true
         validates :middle_kana_name,    presence: true
         validates :birth_date,          presence: true

         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates_format_of :password, with: PASSWORD_REGEX
end
