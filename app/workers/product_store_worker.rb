class ProductStoreWorker
	include Sidekiq::Worker
	# include Sidetiq::Schedulable

  sidekiq_options retry: false

  # recurrence { daily.hour_of_day(23) }

  def perform
    request_url = "https://pricing.us-east-1.amazonaws.com/offers/v1.0/aws/AmazonCloudFront/current/index.json"
    request =  RestClient.get "#{request_url}"
    response = JSON.parse(request.body)
    products = response["products"]
    # create product
    if products.present?
    	products.each do |product|
    		sku = product[1]["sku"]
    		Product.create_with(product_family: product[1]["productFamily"], product_attributes: product[1]["attributes"]).find_or_create_by(sku: sku)
    	end
  		# puts Product.all.count
    end
    # create product variants
		product_variants = response["terms"]["OnDemand"]
		if product_variants.present?
			product_variants.each do |product_variant|
				product = Product.find_by_sku product_variant[0]
				if product.present?
					product_variant[1].each do |p_variant|
						date = p_variant[1]["effectiveDate"]
						p_variant[1]["priceDimensions"].each do |variant|
							ProductVariant.create_with(product: product, effective_date: date, region: 'us-east-1', description: variant[1]["description"], begin_range: variant[1]["beginRange"], end_range: variant[1]["endRange"], unit: variant[1]["unit"], price: variant[1]["pricePerUnit"].first[1], currency: variant[1]["pricePerUnit"].first[0]).find_or_create_by(rate_code: variant[1]["rateCode"])
						end
					end
					
				end
			end
			# puts ProductVariant.all.count
		end
  end
end