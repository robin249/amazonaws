require 'rails_helper'

RSpec.describe Product, type: :model do
  context 'validations' do
  	it {is_expected.to validate_uniqueness_of(:sku)}
  end

  context 'create' do
    it 'product succeeds' do
      product = Product.create(sku: 'ABC', product_family: 'Request', product_attributes: {})
      expect(product.persisted?).to be_truthy
    end
  end
end
