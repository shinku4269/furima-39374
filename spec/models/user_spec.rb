require 'rails_helper'

describe User do
    before do
      @user = FactoryBot.build(:user)
    end

  describe "ユーザー新規登録" do
    context "新規登録ができるとき" do

      it "nickname, family_name, first_name, family_name_furigana, first_name_furigana, birth_day, password, password_confirmation, emailが存在すれば登録できる" do
      expect(@user).to be_valid
      end
      
    end


    context "新規登録ができないとき" do

      it "nicknameが空では登録できない" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      
      it "emailが空では登録できないこと" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end

      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end

      it "emailに@がないと登録できない" do
        @user.email = "test.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end

      it "passwordが空では登録できない" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      
      it "passwordが6文字未満であれば登録できない" do
        @user.password = "abc12"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end

      it "passwordが数字のみ場合は登録できない" do
        @user.password = "123456"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include( "パスワードは不正な値です")
      end

      it "passwordが全角文字を含む場合は登録できない" do
        @user.password = "Ａa12345"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include( "パスワードは不正な値です")
      end

      it "passwordが英語のみ場合は登録できない" do
        @user.password = "abcdef"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include( "パスワードは不正な値です")
      end

      it "passwordとpassword_confirmationが一致しないと登録できない" do
        @user.password = "testtest634"
        @user.password_confirmation = "testtest765"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end

      it "family_nameが空では登録できない" do
        @user.family_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字を入力してください")
      end

      it "first_nameが空では登録できない" do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end

      it "family_nameが全角でない場合は登録できない" do
        @user.family_name = "ﾏｲﾊﾏ"
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字は不正な値です")
      end
  
      it "first_nameが全角でない場合は登録できない" do
        @user.first_name = "ﾐｯｷｰ"
        @user.valid?
        expect(@user.errors.full_messages).to include("名前は不正な値です")
      end
      
      it "family_name_furiganaが空では登録できない" do
        @user.family_name_furigana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字カナを入力してください")
      end

      it "first_name_furiganaが空では登録できない" do
        @user.first_name_furigana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("名前カナを入力してください")
      end

      it "family_name_furiganaが全角でない場合は登録できない" do
        @user.family_name_furigana = "ﾓﾘﾉﾐﾔ"
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字カナは不正な値です")
      end

      it "first_name_furiganaが全角でない場合は登録できない" do
        @user.first_name_furigana = "ﾔｽｺ"
        @user.valid?
        expect(@user.errors.full_messages).to include("名前カナは不正な値です")
      end
  
      it "family_name_furiganaがカタカナでない場合は登録できない" do
        @user.family_name_furigana = "もりのみや"
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字カナは不正な値です")
      end

      it "first_name_furiganaがカタカナでない場合は登録できない" do
        @user.first_name_furigana = "やすこ"
        @user.valid?
        expect(@user.errors.full_messages).to include("名前カナは不正な値です")
      end

      it "birth_dayが空では登録できない" do
        @user.birth_day = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("誕生日を入力してください")
      end
    end
  end
end