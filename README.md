# SHOPPING-CART

This solution is a simple Ruby CLI shopping-cart challenge program, built on Rails, which allows users choose three products and add them to a basket to checkout.

Users can choose from; Greentea, Strawberries and Coffee. These products have assosiated prices and special conditions incorprated into the program.

Versions Covered:

- Ruby version 3.1.2

- RSpec 6.0.1

- Configuration: lib/interface.rb runs the program, while the spec/interface_spec.rb requires the interface.rb file to conduct tests on the solution code, testing a number of different scenarios.

- How to run the program

Users must call ruby lib/interface.rb in their terminal to initalize the program.

When prompted with: "Which item would you like to buy today?"

Users must type either "Greentea", "Strawberries" or "Coffee".

- Special conditions behaviour

If a user (the company CEO) buys a "Greentea", another is added to the basket free of charge not affecting the total-cost.

If a user (the company COO) buys 3 or more "Strawberries", the price of those Strawberries drops to €4.5

If a user (VP of Technology) buys 3 or more "Coffees", the price of all Coffees in the baskets will have a discount of two thirds off.

- How to test the program

Users must call rspec in the terminal to conduct tests of the solution code. The program file interface.rb will initialze with its welcome message, users must type quit into the terminal to run the rspec file.

- Test covered

This program incorprates RSpec 6.0.1 to test 4 crucial segments of the interface.rb file.

MYSHOP:

- Has the correct price of each item in the shop
- Has the correct product code for each item
- Has the correct number of items in stock for each shop product

display_itmes:

- Displays the items available in the shop in the correct order

add_basket:

- It can add items to the basket
- It can add a free Greentea when an even number of them are added
- It can add a free Greentea when an odd number of them are added
- It can modify the price of Strawberries when more than 3 are added
- It can modify the price of Coffee when more than 3 are added

calculate_bill:

- Calculates the total bill correctly

run_shopping:

- It calculates the total bill and displays it in the correct order
