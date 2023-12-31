require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation,name last&firstとname kana last&first,birthdateが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
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

      it 'emailに@が含まれていないと登録できない' do
        @user.email = '08251023jkkk'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email is invalid'
      end

      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include, "Password can't be blank"
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = '07854'
        @user.valid?
        expect(@user.errors.full_messages).to include, 'Password is too short (minimum is 6 characters)'
      end

      it 'passwordは英数字混合でないと登録できない' do
        @user.password = '08256378'
        @user.valid?
        expect(@user.errors.full_messages).to include, 'Password is invalid'
      end

      it 'passwordは英字のみでは登録できない' do
        @user.password = 'yyyyyyyyyy'
        @user.valid?
        expect(@user.errors.full_messages).to include, 'Password is invalid'
      end

      it 'passwordは全角では登録できない' do
        @user.password = 'ウウウウウウウウウウ'
        @user.valid?
        expect(@user.errors.full_messages).to include, 'Password is invalid'
      end

      it 'password_confirmationはpasswordと一致しないと登録できない' do
        @user.password_confirmation = '084@e93k'
        @user.valid?
        expect(@user.errors.full_messages).to include, "Password confirmation doesn't match Password"
      end

      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end

      it 'last_nameが半角では登録できない' do
        @user.last_name = 'yooyoyoyof'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name is invalid'
      end

      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end

      it 'first_nameが半角では登録できない' do
        @user.first_name = 'ggggggggg'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name is invalid'
      end

      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end

      it 'last_name_kanaがカタカナ以外では登録できない' do
        @user.last_name_kana = 'fff用'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name kana is invalid'
      end

      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end

      it 'first_name_kanaがカタカナ以外では登録できない' do
        @user.first_name_kana = 'fffff用'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name kana is invalid'
      end

      it 'birth_dateが空では登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birth date can't be blank"
      end
    end
  end
end
