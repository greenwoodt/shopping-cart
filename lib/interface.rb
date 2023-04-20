puts "Welcome to the Armenitiz shop!"
puts "----------------"

MYSHOP = {
  "Greentea" => {product_code: "GR1", price: 3.11, stock: 10},
  "Strawberries" => {product_code: "SR1", price: 5.00, stock: 10},
  "Coffee" => {product_code: "CF1", price: 11.23, stock: 10}
}

def display_items
  puts "Whats currently avaliable:"
  MYSHOP.each do |product, value |
    puts "(#{value[:product_code]}) | #{product} : €#{value[:price]}"
  end
  puts "----------------"
end

def add_basket(basket, item, amount)
  # A Condition to check the MYSHOP global variable as a key to which gets.chomps allows users to add to the empty hash basket.
  if MYSHOP.key?(item)
    if MYSHOP[item][:stock] >= amount
      basket[item] += amount
      # The CEO condition which checks an item is Greentea and is in the basket. the basket gets an extra tea and stock is removed
      if item == "Greentea"
        basket[item] += amount
        MYSHOP[item][:stock] -= amount
        # If an even no. of Greenteas are added to the basket this modifies the price accordingly.
        if basket[item].even?
          MYSHOP[item][:price] = MYSHOP[item][:price] / 2
        else
          # If an odd number of Greenteas are added, the code only charges 1 as an example adding 1 will have two in the basket but will equal the cost of 1.
          total_bill += MYSHOP[item][:price] / 2
        end
        # The COO condition which checks more than 3 Strawberries are in the basket.
        elsif basket["Strawberries"] >= 3
          MYSHOP["Strawberries"][:price] = 4.5
        # The VP of engineering discounted coffee taking into account Rational used to get 2/3's off.
        elsif basket["Coffee"] >= 3
          MYSHOP["Coffee"][:price] = MYSHOP["Coffee"][:price] * Rational(2, 3)
      end
    end
    elsif item != "quit"
    puts "Sorry we don't have this item in store today"
  end
end

# The total bill variable will be 0 to start off with
total_bill = 0
# By calling Hash.new(0), I'm initalizing the basket with 0 items instead of nil
basket = Hash.new(0)
the_item = ""

# Loop which allows the users to add items to their basket and quit the terminal upon the input of "quit".
until the_item == "quit"
  puts "Which items would you like to today? (or hit enter to quit)"
  the_item = gets.chomp
end

puts "-------BILL---------"

# Product codes are created into an array to store the hash values as a string.
# This allows me to the Join method for the amount of products added by a user
product_codes = []
basket.each do |items, amount|
  total_bill += MYSHOP[items][:price] * amount
  product_codes += [MYSHOP[items][:product_code]] * amount
end

puts "BASKET TOTAL |#{product_codes.join(', ')}| TOTAL PRICE: €#{total_bill.round(2)}"
puts "--------------------"
