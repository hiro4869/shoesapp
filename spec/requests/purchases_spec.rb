require 'rails_helper'

RSpec.describe Purchase, type: :model do
  context "create" do
    it "適切な入力値では作成できる" do
      expect(build(:purchase, nil)).to be_valid
    end

    it "氏名がnilでは失敗" do
      expect(build(:purchase, :name_is_nil)).to be_invalid
    end

    it "購入数がnilでは失敗" do
      expect(build(:purchase, :purchase_num_is_nil)).to be_invalid
    end

    it "住所がnilでは失敗" do
      expect(build(:purchase, :address_is_nil)).to be_invalid
    end

    it "電話番号がnilでは失敗" do
      expect(build(:purchase, :phone_num_is_nil)).to be_invalid
    end

    it "Eメールがnilでは失敗" do
      expect(build(:purchase, :email_is_nil)).to be_invalid
    end

    it "購入数が整数でないと失敗" do
      expect(build(:purchase, :purchase_num_is_not_integer)).to be_invalid
    end

    it "購入数が0では失敗" do
      expect(build(:purchase, :purchase_num_is_0)).to be_invalid
    end

    it "購入数が100より大きいと失敗" do
      expect(build(:purchase, :purchase_num_is_too_many)).to be_invalid
    end

    it "電話番号にハイフンを入れると失敗" do
      expect(build(:purchase, :phone_num_include_hyphen)).to be_invalid
    end

    it "電話番号が全角数字だと失敗" do
      expect(build(:purchase, :phone_num_include_Em)).to be_invalid
    end

    it "電話番号冒頭に半角数字以外が含まれるとと失敗" do
      expect(build(:purchase, :phone_num_include_notnum_first)).to be_invalid
    end    

    it "電話番号末尾に半角数字以外が含まれるとと失敗" do
      expect(build(:purchase, :phone_num_include_notnum_last)).to be_invalid
    end 

    it "電話番号中に半角数字以外が含まれるとと失敗" do
      expect(build(:purchase, :phone_num_include_notnum_inside)).to be_invalid
    end

    it "電話番号中に改行が入るとと失敗" do
      expect(build(:purchase, :phone_num_include_newline)).to be_invalid
    end

    it "Eメールに@がないと失敗" do
      expect(build(:purchase, :email_does_not_have_at)).to be_invalid
    end

    it "Eメールの@の前に文字がないと失敗" do
      expect(build(:purchase, :email_is_nil_before_at)).to be_invalid
    end

    it "Eメールの@の後に文字がないと失敗" do
      expect(build(:purchase, :email_is_nil_after_at)).to be_invalid
    end

    it "Eメール冒頭に全角文字が入ると失敗" do
      expect(build(:purchase, :email_include_Em_first)).to be_invalid
    end

    it "Eメール末尾に全角文字が入ると失敗" do
      expect(build(:purchase, :email_include_Em_last)).to be_invalid
    end

    it "Eメール中に全角文字が入ると失敗" do
      expect(build(:purchase, :email_include_Em_inside)).to be_invalid
    end

    it "Eメール中に改行が入ると失敗" do
      expect(build(:purchase, :email_include_newline)).to be_invalid
    end
  end
end