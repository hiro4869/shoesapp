require 'rails_helper'

RSpec.describe Purchase, type: :model do
  let(:new_purchase) {
    {
      u_name: "fukunaga",
      purchase_num: 5,
      u_address: "渋谷",
      u_phone_num: "0907432323",
      # u_email: "sakurazima48@gmail.com"
    }
  }

  context "create" do
    it "購入は通るか" do
      purchase = Purchase.create! new_purchase
      expect( 1 + 1 ).to eq 2
      # expect { Purchase.create! new_purchase }.to change {Purchase.count}.by(1)
    end
  end

  context "sum" do
    it "足し算ができるか" do
      expect( 1 + 1 ).to eq 2
    end
  end
end






