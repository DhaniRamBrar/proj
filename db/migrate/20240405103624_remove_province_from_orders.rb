class RemoveProvinceFromOrders < ActiveRecord::Migration[7.1]
  def change
    remove_column :orders, :province, :string
  end
end
