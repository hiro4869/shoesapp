class AddDefaultBuyAfterFlagToCart < ActiveRecord::Migration[5.0]
  def up
    change_column :carts, :buy_after_flag, :boolean, default: false
  end

  # 変更前の状態
  def down
    change_column :carts, :buy_after_flag, :boolean
  end
end
