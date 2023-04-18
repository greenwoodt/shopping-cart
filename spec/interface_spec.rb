require 'interface'
require 'rails_helper'
require 'spec_helper'


# First test of the global variable hash with products, stock and price.
describe "#MYSHOP" do

  it "Has the correct number of items in stock for each product" do
    expect(MYSHOP["Greentea"][:stock]).to eq(50)
    expect(MYSHOP["Strawberries"][:stock]).to eq(50)
    expect(MYSHOP["Coffee"][:stock]).to eq(50)
  end

  it "The correct price of each item in the shop" do
    expect(MYSHOP["Greentea"][:price]).to eq(3.11)
    expect(MYSHOP["Strawberries"][:price]).to eq(5.00)
    expect(MYSHOP["Coffee"][:price]).to eq(11.23)
  end

  it "It has the correct product code for each item" do
    expect(MYSHOP["Greentea"][:product_code]).to include("GR1")
    expect(MYSHOP["Strawberries"][:product_code]).to include("SR1")
    expect(MYSHOP["Coffee"][:product_code]).to include("CF1")
  end
end

RSpec.describe "#MYSHOP" do
  it "iterates over each product and prints its product code, name, and price" do
    expected_output = "(GR1) | Greentea : €3.11\n(SR1) | Strawberries : €5.0\n(CF1) | Coffee : €11.23\n"
    expect { MYSHOP.each { |product, value| puts "(#{value[:product_code]}) | #{product} : €#{value[:price]}" } }
      .to output(expected_output).to_stdout
  end
end
