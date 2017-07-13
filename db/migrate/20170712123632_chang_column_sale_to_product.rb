class ChangColumnSaleToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :sale, :boolean, default: false
    add_column :products, :discount_rate, :integer, default: 0
  end
end
