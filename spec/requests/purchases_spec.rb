require 'rails_helper'

RSpec.describe Purchase, type: :model do
  # let(:new_purchase) {
  #   {
  #     u_name: "fukunaga",
  #     purchase_num: 5,
  #     u_address: "渋谷",
  #     u_phone_num: "0907432323",
  #     u_email: "sakurazima48@gmail.com"
  #   }
  # }

  context "create" do
    it "名前と住所が必要" do
    purchase = Purchase.new(
      u_name: "fukunaga",
      # purchase_num: 5,
      # u_address: "渋谷",
      # u_phone_num: "0907432323",
      # u_email: "sakurazima48@gmail.com"
    )
    expect(purchase).to be_invalid
    end
  end

  context "sum" do
    it "足し算ができるか" do
      expect( 1 + 1 ).to eq 2
    end
  end
end






