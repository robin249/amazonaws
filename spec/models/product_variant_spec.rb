require 'rails_helper'

RSpec.describe ProductVariant, type: :model do
  context 'validations' do
  	it {is_expected.to validate_uniqueness_of(:rate_code)}
  end

  context 'create' do
    it 'product succeeds' do
    	product = create(:product)
      productvariant = ProductVariant.create(rate_code: 'ABC', product: product, effective_date: Time.now, region: 'us-east-1', description: '$0.0100 per 10,000 HTTPS Requests', begin_range: '0', end_range: '10240', unit: 'GB', price: '0.06')
      expect(productvariant.persisted?).to be_truthy
    end
  end
end
