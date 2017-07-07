class AddColumnStockToProductVariety < ActiveRecord::Migration[5.0]
  def change
    add_column :product_varieties, :stock, :boolean, default: true
  end
end
