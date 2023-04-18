# The shopping-cart welcome message

puts "Welcome to the Armenitiz shop!"
puts "----------------"

# The hash which contains the symbols of products with their prices including stock

MYSHOP = {
  "Greentea" => {product_code: "GR1", price: 3.11, stock: 50},
  "Strawberries" => {product_code: "SR1", price: 5, stock: 50},
  "Coffee" => {product_code: "CF1", price: 11.23, stock: 50}
}

total_bill = 0
# By calling Hash.new(0), I'm initalizing the basket with 0 items instead of nil
shopping_basket = Hash.new(0)
items = ""

puts "Whats currently avaliable:"

myShop.each do |product, value |
  puts "(#{value[:product_code]}) | #{product} : €#{value[:price]}"
end

puts "----------------"
