class AddNameToAdminUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :admin_users, :name, :string, null: false
  end
end
