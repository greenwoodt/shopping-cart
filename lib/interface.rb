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
      if item == "Coffee" && basket["Coffee"] >= 3
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

def calculate_bill(basket)
  total_bill = 0
  product_codes = []
  basket.each do |item, amount|
    total_bill += MYSHOP[item][:price] * amount
    product_codes += [MYSHOP[item][:product_code]] * amount
  end
  return total_bill.round(2), product_codes
end

def run_shopping
  total_bill = 0
  basket = Hash.new(0)
  item = ""
  display_items

  loop do
    puts "Which item would you like to buy today?"
    item = gets.chomp

    break if item == "quit"

    puts "How many would you like?" if MYSHOP.key?(item)
    amount = gets.chomp.to_i

    add_basket(basket, item, amount)
  end

  total_bill, product_codes = calculate_bill(basket)

  puts "-------BILL---------"
  puts "BASKET-TOTAL |#{product_codes.join(', ')}| TOTAL-COST: €#{total_bill}"
  puts "--------------------"

end

run_shopping
