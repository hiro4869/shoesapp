class AddManyColumnToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :brand_id, :integer
    add_column :products, :sub_name, :string
    add_column :products, :upper_leather, :string
    add_column :products, :outsole, :string
    add_column :products, :heel, :string
    add_column :products, :process, :string
    add_column :products, :repair, :string
    add_column :products, :width, :string
    add_column :products, :made_in, :string
    add_column :products, :maker_description, :string
    add_column :products, :product_code, :string
  end
end

