class ChangeColumnToCart < ActiveRecord::Migration[5.0]
  def change
    rename_column :carts, :product_id, :product_variety_id
  end
end
