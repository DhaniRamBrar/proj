class CreateStaticPages < ActiveRecord::Migration[7.1]
  def change
    create_table :static_pages do |t|
      t.string :title
      t.text :content
      t.string :slug
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end
  end
end
