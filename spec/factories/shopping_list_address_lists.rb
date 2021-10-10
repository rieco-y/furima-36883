FactoryBot.define do
  factory :shopping_list_address_list do
    token {"tok_abcdefghijk00000000000000000"}
    user_id { 1 }
    item_id { 1 }
    post_num { '123-4567' }
    todouhuken_id { 2 }
    city { '東京都' }
    house_num { '1-1' }
    building_name { '東京ハイツ' }
    tel_num { '09012345678' }
  end
end
