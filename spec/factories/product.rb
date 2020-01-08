FactoryGirl.define do
  factory :product, :class => 'Product' do
		sku 'ABC'
		product_family 'Request'
		product_attributes {}
  end

end
