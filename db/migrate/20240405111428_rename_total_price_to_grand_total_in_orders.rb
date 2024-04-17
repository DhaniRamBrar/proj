class RenameTotalPriceToGrandTotalInOrders < ActiveRecord::Migration[7.1]
  def change
    rename_column :orders, :total_price, :grand_total
  end
end
