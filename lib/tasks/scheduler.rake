namespace :sync do
  desc "fetch_products"
  task products: :environment do
    puts "syncing products"
    ProductStoreWorker.perform_async
    puts "products sync started"
  end

end