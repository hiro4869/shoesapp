class CreatePurchases < ActiveRecord::Migration[5.0]
  def change
    create_table :purchases do |t|
      t.integer :user_id
      t.integer :product_id
      t.integer :purchase_num
      t.string :u_name
      t.string :u_address
      t.string :u_phone_num
      t.string :u_email

      t.timestamps
    end
  end
end
