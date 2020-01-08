if ENV["REDISCLOUD_URL"]
	uri = URI.parse(ENV["REDISCLOUD_URL"])
	$redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
elsif Rails.env.development?
	$redis = Redis.new(host: 'localhost', port: 6379)
end
