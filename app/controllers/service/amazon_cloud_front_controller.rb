class Service::AmazonCloudFrontController < ApplicationController

	# http://localhost:3000/service/AmazonCloudFront/index
  def index
	  product_variants = ProductVariant.all

    if product_variants.any?
    	render json: product_variants.map {|pd| {description: pd['description'], beginRange: pd['begin_range'], endRange: pd['end_range'], unit: pd['unit'], pricePerUnit: pd['price'], effectiveDate: pd['effective_date']} }
    else
      error_response('No record found!')
    end
  end

	# http://localhost:3000/service/AmazonCloudFront/region/us-east-1?date=2019-12-02
  def region

  	where = []
    where << ["region = ?", params[:region_name]]
    where << ["effective_date::date = ?", params[:date]]		if params[:date].present?
    condition = [where.map{|c| c[0] }.join(" AND "), *where.map{|c| c[1..-1] }.flatten]
	  product_variants = ProductVariant.where(condition)

    if product_variants.any?
    	render json: product_variants.map {|pd| {description: pd['description'], beginRange: pd['begin_range'], endRange: pd['end_range'], unit: pd['unit'], pricePerUnit: pd['price'], effectiveDate: pd['effective_date']} }
    else
      error_response('No record found!')
    end
  end

end
