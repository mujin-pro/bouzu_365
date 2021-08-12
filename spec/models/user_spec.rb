require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '名前・メールアドレス・パスワードが正しく入力されていれば登録できる' do
        expect(@user).to be_valid
      end

      it 'パスワードとパスワード（確認用）が6文字以上であれば登録できる' do
        @user.password = 'a12345'
        @user.password_confirmation = 'a12345'
        expect(@user).to be_valid
      end

      it 'ミッションは空でも登録できる' do
        @user.mission = ''
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it '名前が空では登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('名前を入力してください')
      end

      it '名前が20文字以上では登録できない' do
        @user.name = 'abcdefghijklmnopqrstuvwxyz'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前は20文字以内で入力してください')
      end

      it 'メールアドレスが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('メールアドレスが入力されていません。')
      end

      it 'メールアドレスに@を含まない場合は登録できない' do
        @user.email = 'test.co.jp'
        @user.valid?
        expect(@user.errors.full_messages).to include('メールアドレスは有効でありません。')
      end

      it '同じメールアドレスが登録済みの場合は登録できない' do
        @user.save
        @user2 = FactoryBot.build(:user)
        @user2.email = @user.email
        @user2.valid?
        expect(@user2.errors.full_messages).to include('メールアドレスは既に使用されています。')
      end

      it 'パスワードが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードが入力されていません。')
      end

      it 'パスワードが半角英字のみの場合は登録できない' do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは有効でありません。')
      end

      it 'パスワードが全角の場合は登録できない' do
        @user.password = 'ａ１２３４５'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは有効でありません。')
      end

      it 'パスワードが5文字以下では登録できない' do
        @user.password = 'a1234'
        @user.password_confirmation = 'a1234'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上に設定して下さい。')
      end

      it 'パスワードとパスワード（確認用）が不一致だと登録できない' do
        @user.password = 'a12345'
        @user.password_confirmation = 'a00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('確認用パスワードとパスワードの入力が一致しません')
      end

      it 'パスワード（確認用）が空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('確認用パスワードとパスワードの入力が一致しません')
      end

      it 'ミッションが50文字以上では登録できない' do
        @user.mission = '012345678901234567890123456789012345678901234567890'
        @user.valid?
        expect(@user.errors.full_messages).to include('Missionは50文字以内で入力してください')
      end
      
    end
  end
end
