class CreateProductVarieties < ActiveRecord::Migration[5.0]
  def change
    create_table :product_varieties do |t|
      t.integer :product_id
      t.string :color
      t.string :size
      t.integer :price

      t.timestamps
    end
  end
end
