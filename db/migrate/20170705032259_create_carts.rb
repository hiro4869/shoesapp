class CreateCarts < ActiveRecord::Migration[5.0]
  def change
    create_table :carts do |t|
      t.integer :user_id
      t.integer :product_id
      t.integer :quantity
      t.boolean :buy_after_flag

      t.timestamps
    end
  end
end
