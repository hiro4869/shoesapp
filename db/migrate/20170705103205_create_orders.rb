class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.string :name
      t.string :address
      t.string :email
      t.string :phone_number
      t.string :method_of_payment

      t.timestamps
    end
  end
end
