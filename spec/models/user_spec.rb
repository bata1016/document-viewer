require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    it "ユーザー新規登録ができること" do
      expect(@user).to be_valid
    end
    it "名前が空欄では登録できないこと" do
      @user.name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("名前を入力してください")
    end

    it "メールアドレスが空欄では登録できないこと" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールを入力してください")
    end

    it "同じメールアドレスでは登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
    end

    it "メールアドレスに@がなければ登録できない" do
      @user.email = "bbbbbbb.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールは不正な値です")
    end

    it "パスワードが空欄では登録できないこと" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
    end

    it "確認用パスワードが空欄では登録できないこと" do
      @user.password_confirmation = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）を入力してください")
    end

    it "パスワードと確認用パスワードが異なると登録できないこと" do
      @user.password_confirmation = "h313fhebfeh"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end

    it "パスワードは半角英数字が混合されていなければ登録できないこと" do
      @user.password = "dddddd"
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは半角英数字で入力してください")
    end

    it "パスワードは6文字以上でないと登録できないこと" do
      @user.password = "was12"
      @user.password_confirmation = @user.password 
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
    end
  end
end
