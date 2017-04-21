require 'rails_helper'

RSpec.describe Purchase, type: :model do
  context "create" do
    it "適切な入力値では作成できる" do
      purchase = Purchase.new(
        u_name: "fukunaga",
        purchase_num: 5,
        u_address: "渋谷",
        u_phone_num: "09012345678",
        u_email: "test@gmail.com"
      )
      expect(purchase).to be_valid
    end

    it "氏名がnilでは失敗" do
      purchase = Purchase.new(
        # u_name: "fukunaga",
        purchase_num: 5,
        u_address: "渋谷",
        u_phone_num: "09012345678",
        u_email: "test@gmail.com"
      )
      expect(purchase).to be_invalid
    end

    it "購入数がnilでは失敗" do
      purchase = Purchase.new(
        u_name: "fukunaga",
        # purchase_num: 5,
        u_address: "渋谷",
        u_phone_num: "09012345678",
        u_email: "test@gmail.com"
      )
      expect(purchase).to be_invalid
    end

    it "住所がnilでは失敗" do
      purchase = Purchase.new(
        u_name: "fukunaga",
        purchase_num: 5,
        # u_address: "渋谷",
        u_phone_num: "09012345678",
        u_email: "test@gmail.com"
      )
      expect(purchase).to be_invalid
    end

    it "電話番号がnilでは失敗" do
      purchase = Purchase.new(
        u_name: "fukunaga",
        purchase_num: 5,
        u_address: "渋谷",
        # u_phone_num: "09012345678",
        u_email: "test@gmail.com"
      )
      expect(purchase).to be_invalid
    end

    it "Eメールがnilでは失敗" do
      purchase = Purchase.new(
        u_name: "fukunaga",
        purchase_num: 5,
        u_address: "渋谷",
        u_phone_num: "09012345678",
        # u_email: "test@gmail.com"
      )
      expect(purchase).to be_invalid
    end

    it "購入数が整数でないと失敗" do
      purchase = Purchase.new(
        u_name: "fukunaga",
        purchase_num: 1.5,
        u_address: "渋谷",
        u_phone_num: "09012345678",
        u_email: "test@gmail.com"
      )
      expect(purchase).to be_invalid
    end

    it "購入数が0では失敗" do
      purchase = Purchase.new(
        u_name: "fukunaga",
        purchase_num: 0,
        u_address: "渋谷",
        u_phone_num: "09012345678",
        u_email: "test@gmail.com"
      )
      expect(purchase).to be_invalid
    end

    it "購入数が100より大きいと失敗" do
      purchase = Purchase.new(
        u_name: "fukunaga",
        purchase_num: 101,
        u_address: "渋谷",
        u_phone_num: "09012345678",
        u_email: "test@gmail.com"
      )
      expect(purchase).to be_invalid
    end

    it "電話番号にハイフンを入れると失敗" do
      purchase = Purchase.new(
        u_name: "fukunaga",
        purchase_num: 5,
        u_address: "渋谷",
        u_phone_num: "090-1234-5678",
        u_email: "test@gmail.com"
      )
      expect(purchase).to be_invalid
    end

    it "電話番号が全角数字だと失敗" do
      purchase = Purchase.new(
        u_name: "fukunaga",
        purchase_num: 5,
        u_address: "渋谷",
        u_phone_num: "０９０１２３４５６７８",
        u_email: "test@gmail.com"
      )
      expect(purchase).to be_invalid
    end

    it "電話番号冒頭に半角数字以外が含まれるとと失敗" do
      purchase = Purchase.new(
        u_name: "fukunaga",
        purchase_num: 5,
        u_address: "渋谷",
        u_phone_num: "あ09012345678",
        u_email: "test@gmail.com"
      )
      expect(purchase).to be_invalid
    end    

    it "電話番号末尾に半角数字以外が含まれるとと失敗" do
      purchase = Purchase.new(
        u_name: "fukunaga",
        purchase_num: 5,
        u_address: "渋谷",
        u_phone_num: "09012345678あ",
        u_email: "test@gmail.com"
      )
      expect(purchase).to be_invalid
    end 

    it "電話番号中に半角数字以外が含まれるとと失敗" do
      purchase = Purchase.new(
        u_name: "fukunaga",
        purchase_num: 5,
        u_address: "渋谷",
        u_phone_num: "090あ12345678",
        u_email: "test@gmail.com"
      )
      expect(purchase).to be_invalid
    end

    it "電話番号中に改行が入るとと失敗" do
      purchase = Purchase.new(
        u_name: "fukunaga",
        purchase_num: 5,
        u_address: "渋谷",
        u_phone_num: "0901
        2345678",
        u_email: "test@gmail.com"
      )
      expect(purchase).to be_invalid
    end

    it "Eメールに@がないと失敗" do
      purchase = Purchase.new(
        u_name: "fukunaga",
        purchase_num: 5,
        u_address: "渋谷",
        u_phone_num: "09012345678",
        u_email: "testgmail.com"
      )
      expect(purchase).to be_invalid
    end

    it "Eメールの@の前に文字がないと失敗" do
      purchase = Purchase.new(
        u_name: "fukunaga",
        purchase_num: 5,
        u_address: "渋谷",
        u_phone_num: "09012345678",
        u_email: "@gmail.com"
      )
      expect(purchase).to be_invalid
    end

    it "Eメールの@の後に文字がないと失敗" do
      purchase = Purchase.new(
        u_name: "fukunaga",
        purchase_num: 5,
        u_address: "渋谷",
        u_phone_num: "09012345678",
        u_email: "test@"
      )
      expect(purchase).to be_invalid
    end

    it "Eメール冒頭に全角文字が入ると失敗" do
      purchase = Purchase.new(
        u_name: "fukunaga",
        purchase_num: 5,
        u_address: "渋谷",
        u_phone_num: "09012345678",
        u_email: "あtest@gmail.com"
      )
      expect(purchase).to be_invalid
    end

    it "Eメール末尾に全角文字が入ると失敗" do
      purchase = Purchase.new(
        u_name: "fukunaga",
        purchase_num: 5,
        u_address: "渋谷",
        u_phone_num: "09012345678",
        u_email: "test@gmail.comあ"
      )
      expect(purchase).to be_invalid
    end

    it "Eメール中に全角文字が入ると失敗" do
      purchase = Purchase.new(
        u_name: "fukunaga",
        purchase_num: 5,
        u_address: "渋谷",
        u_phone_num: "09012345678",
        u_email: "testあ@gmail.com"
      )
      expect(purchase).to be_invalid
    end

    it "Eメール中に改行が入ると失敗" do
      purchase = Purchase.new(
        u_name: "fukunaga",
        purchase_num: 5,
        u_address: "渋谷",
        u_phone_num: "09012345678",
        u_email: "test@
        gmail.com"
      )
      expect(purchase).to be_invalid
    end
  end
end






