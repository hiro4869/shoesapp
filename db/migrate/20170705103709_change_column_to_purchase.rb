class ChangeColumnToPurchase < ActiveRecord::Migration[5.0]
  def change
    # 追加
    add_column :purchases, :order_id, :integer
    add_column :purchases, :price, :integer
    add_column :purchases, :p_name, :string

    # 削除
    remove_column :purchases, :u_name, :string
    remove_column :purchases, :u_address, :string
    remove_column :purchases, :u_phone_num, :string
    remove_column :purchases, :u_email, :string
    remove_column :purchases, :user_id, :integer

    # カラム名を変更
    rename_column :purchases, :purchase_num, :quantity
  end
end
