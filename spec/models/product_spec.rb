require 'rails_helper'

RSpec.describe Product, type: :model do
  before(:each) do
    @category = Category.new(name: 'temp')
  end
  context 'given a product' do
    it 'accepts the product' do
      @no_blanks = Product.new(name: 'hipster product1', price_cents: 3, quantity: 1, :category => @category)
      expect(@no_blanks.errors).not_to include('can\'t be blank')
    end
  end

  context 'given a product without a price' do
    it 'should raise an error' do
      @new_product = Product.new(name: 'someName', quantity: 1, :category => @category)
      expect(@new_product).to_not be_valid
      expect(@new_product.errors.messages[:price]).to include('can\'t be blank')
    end
  end

  context 'given a product without a name' do
    it 'should raise an error' do
      @new_product = Product.new(price_cents: 5, quantity: 1, :category => @category)
      expect(@new_product).to_not be_valid
      expect(@new_product.errors.messages[:name]).to include('can\'t be blank')
    end
  end

  context 'given a product without a quantity' do
    it 'should raise an error' do
      @new_product = Product.new(price_cents: 5, name: 'someName', :category => @category)
      expect(@new_product).to_not be_valid
      expect(@new_product.errors.messages[:quantity]).to include('can\'t be blank')
    end
  end

  context 'given a product without a category' do
    it 'should raise an error' do
      @new_product = Product.new(price_cents: 5, quantity: 1, name: 'someName')
      expect(@new_product).to_not be_valid
      expect(@new_product.errors.messages[:category]).to include('can\'t be blank')
    end
  end

end
