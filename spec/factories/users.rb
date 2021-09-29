FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {'test'}
    last_name_kana        {'test'}
    first_name            {'test'}
    first_name_kana       {'test'}
    birth_date            {2020/10/01}
  end
end