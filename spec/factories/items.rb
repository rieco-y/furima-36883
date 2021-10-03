FactoryBot.define do
  factory :item do
    image {Faker::Lorem.sentence}
    item_name {"テスト"}
    item_text {"テスト説明"}
    price {11111}
    category_id {2}
    condition_id {2}
    delivery_cost_id {2}
    todouhuken_id {2}
    send_schedule_id {2}
    association :user 

    after(:build) do |item|
     item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
