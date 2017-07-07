class ChangeColumnProductidToPurchase < ActiveRecord::Migration[5.0]
  def change
    rename_column :purchases, :product_id, :product_variety_id
  end
end
