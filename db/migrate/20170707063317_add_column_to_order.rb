class AddColumnToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :postage, :integer
  end
end
