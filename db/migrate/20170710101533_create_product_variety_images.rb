class CreateProductVarietyImages < ActiveRecord::Migration[5.0]
  def change
    create_table :product_variety_images do |t|
      t.integer :product_variety_id
      t.string :image

      t.timestamps
    end
  end
end
