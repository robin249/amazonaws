# README

This README would normally document whatever steps are necessary to get the application up and running.

Here are the step to fetch the Amazon CLoudFront On-Demand pricing from the API and stored in database:
- created a worker 'app/workers/product_store_worker', which use API and store product records in database.
- created a task 'lib/tasks/schedular.rake', which call the worker
- you can use below command on console to call the schedular
	"rake sync:products"
- used whenever gem for cron job which will run daily at midnight to fetch the product (config/schedule.rb)
- used rspec for unit testing.

API's:
Below are the API's created as per reuirement:
1. API to view pricing for a specific region
http://localhost:3000/service/AmazonCloudFront/region/us-east-1

2. API to filter data according to the date specified
http://localhost:3000/service/AmazonCloudFront/region/us-east-1?date=2019-12-02.


Note: you can add pricing for more services when needed
