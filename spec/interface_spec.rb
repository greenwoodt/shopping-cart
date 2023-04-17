require "interface"

describe "#shop" do
  it "should have the following products" do
  expect(shop).to include(
    "Greentea" => {product_code: "GR1", price: 3.11, stock: 50},
    "Strawberries" => {product_code: "SR1", price: 5.00, stock: 50},
    "Coffee" => {product_code: "CF1", price: 11.23, stock: 50}
  )
  end
end
