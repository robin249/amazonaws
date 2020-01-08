Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :service do
  	get "/AmazonCloudFront/index", :to => 'amazon_cloud_front#index'
  	get "/AmazonCloudFront/region/:region_name", :to => 'amazon_cloud_front#region'
  end
end
