require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録/ユーザー情報' do
    context '新規登録できる場合' do
      it '全ての項目が入力されていれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@がないものは登録できない' do
        @user.email = 'aaabbb'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordは英字がないものは登録できない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Must contain both letters and numbers')
      end
      it 'passwordは数字がないものは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Must contain both letters and numbers')
      end
      it 'passwoedは全角文字を含むものは登録できない' do
        @user.password = 'ａａａ１１１'
        @user.password_confirmation = 'ａａａ１１１'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Must contain both letters and numbers')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
  describe '新規登録/本人情報' do
    it 'お名前(全角)が空では登録できない' do
      @user.last_name = ''
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank", "First name can't be blank"
    end
    it 'お名前(全角)はアルファベット、半角カタカナでは登録できない' do
      @user.last_name = 'yamada'
      @user.first_name = 'ﾊﾅｺ'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Last name 全角文字を使用してください', 'First name 全角文字を使用してください'
    end
    it 'お名前カナ(全角)が空では登録できない' do
      @user.last_name_kana = ''
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana can't be blank", "First name kana can't be blank"
    end
    it 'お名前カナ(全角)はアルファベット、半角カタカナでは登録できない' do
      @user.last_name_kana = 'yamada'
      @user.first_name_kana = 'ﾊﾅｺ'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Last name kana 全角カタカナを使用してください', 'First name kana 全角カタカナを使用してください'
    end
    it '生年月日が空では登録できない' do
      @user.birth_date = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birth date can't be blank"
    end
  end
end

