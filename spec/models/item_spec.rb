require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品商品の保存' do
    context "出品商品が保存できる場合" do
      it "全ての項目が入力されていれば保存できる" do
        expect(@item).to be_valid
      end
    end
    context "出品商品が保存できない場合" do
      it "商品画像がないと保存できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end     
      it "商品名がないと保存できない" do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end     
      it "商品説明がないと保存できない" do
        @item.item_text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item text can't be blank"
      end     
      it "商品の状態の情報がないと保存できない" do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition Please select one"
      end     
      it "配送料の負担の情報がないと保存できない" do
        @item.delivery_cost_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery cost Please select one"
      end     
      it "発送元の地域の情報がないと保存できない" do
        @item.todouhuken_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Todouhuken Please select one"
      end     
      it "発送までの日数の情報がないと保存できない" do
        @item.send_schedule_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Send schedule Please select one"
      end     
      it "商品価格の情報がないと保存できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end     
      it "商品価格は299円以下は保存できない" do
        @item.price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is out of setting range"
      end     
      it "商品価格は10,000,000円以上は保存できない" do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is out of setting range"
      end     
      it "商品価格は全角文字では保存できない" do
        @item.price = '１１１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is out of setting range"
      end           
      it "ユーザーが紐付いていないと保存できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "User must exist"
      end
    end
  end

end


