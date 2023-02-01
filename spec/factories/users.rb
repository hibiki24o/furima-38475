FactoryBot.define do
  factory :user do
    email                 {Faker::Internet.free_email}
    password              {'1a1a1a1a'}
    password_confirmation {password}
    fast_name             {'山田'}
    middle_name           {'太郎'}
    fast_kana_name        {'ヤマダ'}
    middle_kana_name      {'タロウ'}
    birth_date            {'2000-12-23'}
    nickname              {'test'}
    

  end
end
