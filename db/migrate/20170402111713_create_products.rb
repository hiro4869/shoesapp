class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.integer :price
      t.string :p_name
      t.text :description

      t.timestamps
    end
  end
end
