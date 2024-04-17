class AddProvinceToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :province_id, :integer
    add_foreign_key :users, :provinces
  end
end
