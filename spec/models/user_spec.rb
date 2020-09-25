require "rails_helper"

RSpec.describe User, type: :model do
  describe "userの保存" do
    before do
      @user = FactoryBot.build(:user)
    end
    context "ユーザー登録がうまくいくとき" do
      it "すべての値が正しく入力されていれば保存できること" do
        expect(@user).to be_valid
      end
    end
    context "新規登録がうまくいかないとき" do
      it "nicknameが空だと保存できないこと" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it "emailが空だと保存できないこと" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it "emailが重複していると保存できないこと" do
        another_user = FactoryBot.create(:user)
        @user.email = another_user.email
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it "passwordが空だと保存できないこと" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it "passwordが６文字未満だと保存できないこと" do
        @user.password = "1234a"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
    end
  end
end
