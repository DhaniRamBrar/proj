# Email: admin@gmail.com
# password: 12345678

# db/seeds.rb
# Product.destroy_all
# Category.destroy_all
# # Categories
# categories = [
#   { name: "Bamboo Toothbrushes" },
#   { name: "Eco-Friendly Toothpaste" },
#   { name: "Biodegradable Dental Floss" },
#   { name: "Reusable Mouthwash Bottles" },
#   { name: "Natural Tooth-Whitening Kits" }
# ]

# puts "Creating categories..."
# categories.each do |category|
#   Category.create!(category)
# end
# puts "#{Category.count} categories created."

# # Products
# products = [
#   { category_id: Category.find_by(name: "Bamboo Toothbrushes").id, name: "Adult Bamboo Toothbrush", description: "Biodegradable bamboo handle with BPA-free nylon bristles for adults.", price: 4.99, stock_available: true },
#   { category_id: Category.find_by(name: "Bamboo Toothbrushes").id, name: "Kids Bamboo Toothbrush", description: "Specially sized for kids with soft BPA-free bristles and a biodegradable bamboo handle.", price: 4.49, stock_available: true },
#   { category_id: Category.find_by(name: "Eco-Friendly Toothpaste").id, name: "Charcoal Whitening Toothpaste", description: "Natural toothpaste with activated charcoal for whitening, in recyclable packaging.", price: 7.99, stock_available: true },
#   { category_id: Category.find_by(name: "Biodegradable Dental Floss").id, name: "Natural Silk Floss", description: "Biodegradable silk floss in a zero-waste glass container.", price: 6.99, stock_available: true },
#   { category_id: Category.find_by(name: "Reusable Mouthwash Bottles").id, name: "Glass Mouthwash Bottle", description: "Reusable and eco-friendly glass bottle for mouthwash.", price: 12.99, stock_available: true },
#   { category_id: Category.find_by(name: "Natural Tooth-Whitening Kits").id, name: "Eco-Friendly Whitening Kit", description: "Natural teeth whitening kit including bamboo toothbrush and charcoal powder.", price: 19.99, stock_available: true },
#   { category_id: Category.find_by(name: "Eco-Friendly Toothpaste").id, name: "Peppermint Herbal Toothpaste", description: "Fluoride-free herbal toothpaste with a refreshing peppermint flavor.", price: 7.99, stock_available: true },
#   { category_id: Category.find_by(name: "Biodegradable Dental Floss").id, name: "Cornstarch Dental Floss", description: "Vegan and biodegradable dental floss made from cornstarch.", price: 5.99, stock_available: true },
#   { category_id: Category.find_by(name: "Reusable Mouthwash Bottles").id, name: "Refillable Mouthwash Tablet Bottle", description: "Eco-friendly mouthwash tablets with a refillable bottle.", price: 9.99, stock_available: true },
#   { category_id: Category.find_by(name: "Bamboo Toothbrushes").id, name: "Family Pack Bamboo Toothbrushes", description: "A pack of 4 eco-friendly bamboo toothbrushes for the whole family.", price: 16.99, stock_available: true }
# ]

# puts "Creating products..."
# products.each do |product|
#   Product.create!(product)
# end
# puts "#{Product.count} products created."

# puts "Seeding complete."

# order = Order.new(user_id: 1, total_price: 100, status: "pending", address: "123 Street", province: "Province", order_items_attributes: [{product_id: 11, quantity: 2, price: 50}])
# order.save
canadian_provinces = [
  "Alberta",
  "British Columbia",
  "Manitoba",
  "New Brunswick",
  "Newfoundland and Labrador",
  "Nova Scotia",
  "Ontario",
  "Prince Edward Island",
  "Quebec",
  "Saskatchewan",
  "Northwest Territories",
  "Nunavut",
  "Yukon"
]

canadian_provinces.each do |province_name|
  Province.find_or_create_by(name: province_name)
end