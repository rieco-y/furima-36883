require 'rails_helper'

RSpec.describe ShoppingListAddressList, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      @shopping_list_address_list = FactoryBot.build(:shopping_list_address_list, user_id: user.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@shopping_list_address_list).to be_valid
      end
      it '建物名は空でも保存できること' do
        @shopping_list_address_list.building_name = ''
        expect(@shopping_list_address_list).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'tokenが空では登録できないこと' do
        @shopping_list_address_list.token = nil
        @shopping_list_address_list.valid?
        expect(@shopping_list_address_list.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空だと保存できないこと' do
        @shopping_list_address_list.post_num = ''
        @shopping_list_address_list.valid?
        expect(@shopping_list_address_list.errors.full_messages).to include("Post num can't be blank")
      end
      it '郵便番号が半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @shopping_list_address_list.post_num = '1234567'
        @shopping_list_address_list.valid?
        expect(@shopping_list_address_list.errors.full_messages).to include('Post num is invalid. Include hyphen(-)')
      end
      it '都道府県を選択していないと保存できないこと' do
        @shopping_list_address_list.todouhuken_id = '1'
        @shopping_list_address_list.valid?
        expect(@shopping_list_address_list.errors.full_messages).to include('Todouhuken Please select one')
      end
      it '市区町村が空だと保存できないこと' do
        @shopping_list_address_list.city = ''
        @shopping_list_address_list.valid?
        expect(@shopping_list_address_list.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @shopping_list_address_list.house_num = ''
        @shopping_list_address_list.valid?
        expect(@shopping_list_address_list.errors.full_messages).to include("House num can't be blank")
      end
      it '電話番号が空では保存できないこと' do
        @shopping_list_address_list.tel_num = ''
        @shopping_list_address_list.valid?
        expect(@shopping_list_address_list.errors.full_messages).to include("Tel num can't be blank")
      end
      it '電話番号は、9桁未満だと保存できないこと' do
        @shopping_list_address_list.tel_num = '123456789'
        @shopping_list_address_list.valid?
        expect(@shopping_list_address_list.errors.full_messages).to include('Tel num is invalid')
      end
      it '電話番号は、12桁以上だと保存できないこと' do
        @shopping_list_address_list.tel_num = '123456789012'
        @shopping_list_address_list.valid?
        expect(@shopping_list_address_list.errors.full_messages).to include('Tel num is invalid')
      end
      it '電話番号は、全角数値だと保存できないこと' do
        @shopping_list_address_list.tel_num = '０９０１２３４５６７８'
        @shopping_list_address_list.valid?
        expect(@shopping_list_address_list.errors.full_messages).to include('Tel num is invalid')
      end
    end
  end
end
