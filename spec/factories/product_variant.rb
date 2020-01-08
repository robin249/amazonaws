FactoryGirl.define do
  factory :product_variant, :class => 'ProductVariant' do
		association :product, :factory => :product
		rate_code 'ABC'
		effective_date Time.now
		region 'us-east-1'
		description '$0.0100 per 10,000 HTTPS Requests'
		begin_range '0'
		end_range '10240'
		unit 'GB'
		price '0.06'
  end

end
