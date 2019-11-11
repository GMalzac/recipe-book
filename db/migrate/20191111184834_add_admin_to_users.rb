class AddAdminToUsers < ActiveRecord::Migration[6.0]
  def up
    add_column :users, :admin, :boolean, null: false, default: false
  end

  def down
  end
end
