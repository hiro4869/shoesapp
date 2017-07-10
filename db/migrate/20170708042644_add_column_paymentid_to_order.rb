class AddColumnPaymentidToOrder < ActiveRecord::Migration[5.0]
  def change
    # 追加
    add_column :orders, :method_of_payment_id, :integer, default: 1

    # 削除
    remove_column :orders, :method_of_payment, :string
  end
end
