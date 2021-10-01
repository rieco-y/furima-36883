FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { '000zzz' }
    password_confirmation { password }
    last_name             { 'てすと' }
    last_name_kana        { 'テスト' }
    first_name            { '漢字' }
    first_name_kana       { 'カンジ' }
    birth_date            { 2020 / 10 / 0o1 }
  end
end
