class CreateMethodOfPayments < ActiveRecord::Migration[5.0]
  def change
    create_table :method_of_payments do |t|
      t.string :payment

      t.timestamps
    end
  end
end
