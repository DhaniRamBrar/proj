class RemoveProvinceFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :province, :string
  end

end
