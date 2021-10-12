require 'rails_helper'

RSpec.describe "Users", type: :request do

  before do
    @user = FactoryBot.build(:user)
  end

  describe 'edit' do
    it 'editアクションにリクエストすると正常にレスポンスが返ってくる' do 
      @user.save
      get edit_user_path(@user)
      expect(response.status).to eq 200
    end
    it 'editアクションにリクエストするとレスポンスに新しいニックネームの入力フォームが存在する' do 
      @user.save
      get edit_user_path(@user)
      expect(response.body).to include("新しいニックネーム")
    end
    it 'editアクションにリクエストするとレスポンスに新しいメールアドレスの入力フォームが存在する' do 
      @user.save
      get edit_user_path(@user)
      expect(response.body).to include("新しいメールアドレス")
    end
  end 


end
