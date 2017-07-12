class CreateInquiries < ActiveRecord::Migration[5.0]
  def change
    create_table :inquiries do |t|
      t.string :title
      t.string :name
      t.string :email
      t.text :body

      t.timestamps
    end
  end
end