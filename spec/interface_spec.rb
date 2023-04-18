require 'interface'
require 'rails_helper'
require 'spec_helper'


describe "#myShop" do
  let(:myShop) do
    {
      "Greentea" => {product_code: "GR1", price: 3.11, stock: 50},
      "Strawberries" => {product_code: "SR1", price: 5, stock: 50},
      "Coffee" => {product_code: "CF1", price: 11.23, stock: 50}
    }
  end

  it "Has the Greentea drink" do
    expect(myShop["Greentea"]).to include({product_code: "GR1", price: 3.11, stock: 50})
  end

  it "Has Strwaberries" do
    expect(myShop["Strawberries"]).to include({product_code: "SR1", price: 5, stock: 50})
  end

  it "Has the Coffee drink" do
    expect(myShop["Coffee"]).to include({product_code: "CF1", price: 11.23, stock: 50})
  end

  it "Has the correct number of items in stock for each product" do
    expect(myShop["Greentea"][:stock]).to eq(50)
    expect(myShop["Strawberries"][:stock]).to eq(50)
    expect(myShop["Coffee"][:stock]).to eq(50)
  end

  it "The correct price of each item in the shop" do
    expect(myShop["Greentea"][:price]).to eq(3.11)
    expect(myShop["Strawberries"][:price]).to eq(5)
    expect(myShop["Coffee"][:price]).to eq(11.23)
  end

  it "It has the correct product code for each item" do
    expect(myShop["Greentea"][:product_code]).to include("GR1")
    expect(myShop["Strawberries"][:product_code]).to include("SR1")
    expect(myShop["Coffee"][:product_code]).to include("CF1")
  end
end
