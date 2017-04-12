class ChangeColumnToUserRoleInteger < ActiveRecord::Migration[5.0]

  def up
    change_column :users, :role, :integer, default: 0
  end

  def down
    change_column :users, :role, :string, default: 0
  end
end
