
# this task will run daily at 11:00pm
every 1.day, at: '24:00 pm' do
  rake "sync:products"
end