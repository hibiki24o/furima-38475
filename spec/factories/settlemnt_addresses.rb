FactoryBot.define do
  factory :settlemnt_addresse do

      postal_code      { '123-1234'}
      prefecture_id    { 3 }
      city             { '横浜市緑区' }
      address          { '3-4' }
      build_name       { '青山ビル' }
      tell             { '09012341234' }
      token            {"tok_abcdefghijk00000000000000000"}
  end
end