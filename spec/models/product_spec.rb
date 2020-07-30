require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here

    before(:each) do
      @category = Category.create(name: "Kitchen Utensils")
      @product = @category.products.new(name: "Fork", price: 12, quantity: 7)
    end

    it 'should exist' do
      expect(@product).to be_valid
      # puts @product.errors.full_messages
    end

    it 'should have a name' do
      # puts @product.name
      @product.name = nil
      # puts @product.name
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    # TODO why can't i set price to nil! new passing test below, but unsure why @product.price = nil doesn't work
    # it 'should have a price' do
    #   # puts @product.name
    #   # puts @product.price
    #   # @product.price ||= nil
    #   @product.price = nil
    #   # puts @product.name
    #   # puts @product.price
    #   expect(@product).to_not be_valid
    #   # puts @product.errors.full_messages
    #   expect(@product.errors.full_messages).to include("Price can't be blank")
    # end
    
    it 'should have a price' do
      @product = @category.products.new(name: "Spoon", price: nil, quantity: 300)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'should have a quantity' do
      # puts 'should have a quantity ' 
      # puts @product.quantity
      @product.quantity = nil
      # puts 'should not have quantity ' 
      # puts @product.quantity
      expect(@product).to_not be_valid
      # puts @product.errors.full_messages
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
      
    end
    
    # TODO Why is this failing? = nil works for some of the other tests, test below works in the meantime. 
    # it 'should have a category' do
    #   @product.category_id = nil
    #   expect(@product).to_not be_valid
    #   expect(@product.errors.full_messages).to include("Category can't be blank")
    # end
    
    it 'should have a category' do
      @product = Product.new(name: "Blender", price: 4500, quantity: 1, category_id: nil)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end