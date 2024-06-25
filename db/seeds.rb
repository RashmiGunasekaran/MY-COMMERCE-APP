# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'csv'

#User CSV
users_text = File.read(Rails.root.join('lib/seed_csv/users.csv'))

users_csv = CSV.parse(users_text, :headers => true, :encoding => 'ISO-8859-1')

users_csv.each do |row|
  user = User.new
  user.user_name = row['USERNAME']
  user.email = row['EMAIL']
  user.phone_number = row['PHONE']
  user.save
end


#Product CSV
products_text = File.read(Rails.root.join('lib/seed_csv/products.csv'))

products_csv = CSV.parse(products_text, :headers => true, :encoding => 'ISO-8859-1')

products_csv.each do |row|
  product = Product.new
  product.code = row['CODE']
  product.name = row['NAME']
  product.category = row['CATEGORY']
  product.save
end


#Order Details CSV
order_details_text = File.read(Rails.root.join('lib/seed_csv/order_details.csv'))  

order_details_csv = CSV.parse(order_details_text, :headers => true, :encoding => 'ISO-8859-1')

order_details_csv.each do |row|
  order_detail = OrderDetail.new
  order_detail.user_email = row['USER_EMAIL']
  order_detail.product_code = row['PRODUCT_CODE']
  order_detail.order_date = row['ORDER_DATE']
  order_detail.save
end