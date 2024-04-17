class Product < ApplicationRecord
  has_one_attached :image
  belongs_to :category
  has_many :order_items
  validates :name, :description, :price, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["category_id", "created_at", "description", "id", "name", "price", "sale", "stock_available", "updated_at"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["category", "image_attachment", "image_blob", "order_items"]
  end

  def self.search_and_filter(options = {})
  products = all
  if options[:keyword].present?
    keyword = options[:keyword].downcase
    products = products.where("LOWER(name) LIKE ? OR LOWER(description) LIKE ?", "%#{keyword}%", "%#{keyword}%")
  end
  products = products.where(category_id: options[:category_id]) if options[:category_id].present?
  products
end
end
