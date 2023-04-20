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
  total_bill = 0
  if MYSHOP.key?(item)
    if MYSHOP[item][:stock] >= amount
      basket[item] += amount

      if item == "Greentea"
        basket[item] += amount

        if basket[item].even?
          MYSHOP[item][:price] = MYSHOP[item][:price] / 2
        else
          total_bill += MYSHOP[item][:price] / 2
        end
      end
      if basket["Strawberries"] >= 3
        MYSHOP["Strawberries"][:price] = 4.5
        total_bill += MYSHOP["Strawberries"][:price] * (basket["Strawberries"] - (basket["Strawberries"] % 3))
      end
      if basket["Coffee"] >= 3
        MYSHOP["Coffee"][:price] = MYSHOP["Coffee"][:price] * Rational(2, 3)
        total_bill += MYSHOP["Coffee"][:price] * (basket["Coffee"] - (basket["Coffee"] % 3))
      end
      MYSHOP[item][:stock] -= amount
    else
      puts "Sorry we don't have enough #{item} in store today"
      return false
    end
  else
    puts "Sorry, we don't stock #{item} today"
    return false
  end
  return total_bill
end

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
