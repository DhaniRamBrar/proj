class AddSaleToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :sale, :boolean, default: false
  end
end
