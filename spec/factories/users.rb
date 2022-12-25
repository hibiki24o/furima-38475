FactoryBot.define do
  factory :user do
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    fast_name             {'山田'}
    middle_name           {'太郎'}
    fast_kana_name        {'ヤマダ'}
    middle_kana_name      {'タロウ'}
    birth_date            {'2000-12-23'}
    created_at            {'2000-12-23'}
    updated_at            {'2020-12-24'}
    nickname              {'test'}
    

  end
end
