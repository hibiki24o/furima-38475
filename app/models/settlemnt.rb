class Settlemnt < ApplicationRecord
   has_one    :shipping_addresse
   belongs_to :product
   belongs_to :user
end
