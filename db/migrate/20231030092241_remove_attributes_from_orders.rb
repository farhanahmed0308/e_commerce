class RemoveAttributesFromOrders < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :user_name, :string
    remove_column :orders, :address, :string
  end
end
