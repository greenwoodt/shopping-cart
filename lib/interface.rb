# The shopping-cart welcome message

puts "Welcome to the Armenitiz shop!"
puts "----------------"

# The hash which contains the symbols of products with their prices including stock
MYSHOP = {
  "Greentea" => {product_code: "GR1", price: 3.11, stock: 50},
  "Strawberries" => {product_code: "SR1", price: 5.00, stock: 50},
  "Coffee" => {product_code: "CF1", price: 11.23, stock: 50}
}

# The total bill variable will be 0 to start off with
total_bill = 0
# By calling Hash.new(0), I'm initalizing the basket with 0 items instead of nil
shopping_basket = Hash.new(0)
items = ""

puts "Whats currently avaliable:"

MYSHOP.each do |product, value |
  puts "(#{value[:product_code]}) | #{product} : €#{value[:price]}"
end

puts "----------------"

# Loop which allows the users to add items to their basket and quit the terminal upon the input of "quit".
until items == "quit"
  puts "Which items would you like to today? (or hit enter to quit)"
  items = gets.chomp

  # A Condition to check the MYSHOP global variable as a key to which gets.chomps allows users to add to the empty hash basket.
  if MYSHOP.key?(the_item)
    puts "How many would you like?"
    the_amount = gets.chomp.to_i
    if MYSHOP[the_item][:stock] >= the_amount
      basket[the_item] += the_amount

      # The CEO condition which checks an item is Greentea and is in the basket. the basket gets an extra tea and stock is removed
      if the_item == "Greentea"
        basket[the_item] += the_amount
        MYSHOP[the_item][:stock] -= the_amount

        # If an even no. of Greenteas are added to the basket this modifies the price accordingly.
        if basket[the_item].even?
          MYSHOP[the_item][:price] = MYSHOP[the_item][:price] / 2
          else
            # If an odd number of Greenteas are added, the code only charges 1 as anexample adding 1 will have two in the basket but will equal the cost of 1.
            total_bill += MYSHOP[the_item][:price] / 2
        end
        # The COO condition which checks more than 3 Strawberries are in the basket.
        elsif basket["Strawberries"] >= 3
          MYSHOP["Strawberries"][:price] = 4.5

        # The VP of engineering discounted coffee taking into account Rational used to get 2/3's off.
        elsif basket["Coffee"] >= 3
          MYSHOP["Coffee"][:price] = MYSHOP["Coffee"][:price] * Rational(2, 3)
      end
      MYSHOP[the_item][:stock] -= the_amount
    end
    elsif the_item != "quit"
      puts "Sorry we don't have this item in store today"
  end
end
