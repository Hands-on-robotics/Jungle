require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before do
      @category = Category.create(name: "Test Category")
      @product = Product.new(name: "Test Product", price: 100, quantity: 10, category: @category)
    end

    it 'saves successfully when all fields are set' do
      expect(@product.save).to be true
    end

    it 'validates the presence of a name' do
      @product.name = nil
      @product.save
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'validates the presence of a price' do
      @product.price_cents = nil
      @product.save
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'validates the presence of quantity' do
      @product.quantity = nil
      @product.save
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'validates the presence of a category' do
      @product.category = nil
      @product.save
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end

