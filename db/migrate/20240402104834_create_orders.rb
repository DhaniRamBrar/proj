class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.decimal :total_price, precision: 10, scale: 2
      t.string :status
      t.text :address
      t.string :province
      t.timestamps
    end
  end
end
