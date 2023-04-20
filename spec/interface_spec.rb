require 'interface'

RSpec.describe "#MYSHOP" do
  let(:basket) { [] }
    it "Has the correct price of each item in the shop" do
      expect(MYSHOP["Greentea"][:price]).to eq(3.11)
      expect(MYSHOP["Strawberries"][:price]).to eq(5.0)
      expect(MYSHOP["Coffee"][:price]).to eq(11.23)
    end

    it "Has the correct product code for each item" do
      expect(MYSHOP["Greentea"][:product_code]).to eq("GR1")
      expect(MYSHOP["Strawberries"][:product_code]).to eq("SR1")
      expect(MYSHOP["Coffee"][:product_code]).to eq("CF1")
    end

    it "Has the correct number of items in stock for each shop product" do
      expected_greentea_stock = 10
      expected_greentea_stock -= 5 if basket.include?("GR1")

      expect(MYSHOP["Greentea"][:stock]).to eq(expected_greentea_stock)
      expect(MYSHOP["Strawberries"][:stock]).to eq(10)
      expect(MYSHOP["Coffee"][:stock]).to eq(10)
    end
  end

  RSpec.describe "#display_items" do
    it "Displays the items available in the shop in the correct order" do
      MYSHOP.each do |product, value|
        expect { display_items }.to output(/#{value[:product_code]}.*#{product}.*#{value[:price]}/).to_stdout
      end
    end
  end

  RSpec.describe "#add_basket" do
    before do
      @basket = Hash.new(0)
      @item = "Greentea"
      @amount = 1
    end

    it "It adds items to the basket" do
      add_basket(@basket, @item, @amount)
      expect(@basket[@item]).to eq(2)
    end

    it "It adds a free Greentea when an even number of them are added" do
      add_basket(@basket, @item, @amount)
      expect(MYSHOP[@item][:price]).to eq(0.7775)
    end

    it "It adds a free Greentea when an odd number of them are added" do
      add_basket(@basket, @item, 3)
      expect(MYSHOP[@item][:price]).to eq(0.38875)
    end

    it "It modifies the price of Strawberries when more than 3 are added" do
      add_basket(@basket, "Strawberries", 4)
      expect(MYSHOP["Strawberries"][:price]).to eq(4.5)
    end

    it "It modifies the price of Coffee when more than 3 are added" do
      add_basket(@basket, "Coffee", 3)
      expect(MYSHOP["Coffee"][:price]).to eq(Rational(7.486666666666666))
    end
  end
