require 'sequel'
require 'byebug'

# select name , services.description, services.price::money from services
# join customers_services on service_id = services.id
# join customers on customer_id = customers.id group by name, services.description, services.price  order by name, lower(description) ;

DB = Sequel.postgres('billing2', host: 'localhost')

result = DB[:services]
  .select{[name, description, price.cast(:money)]}
  .join(:customers_services, service_id: :id)
  .join(:customers, id: :customer_id)
  .group(:name,:description, :price)
  .order{[ name, lower(description)]}

customer_name = nil

result.each do |row|
  if customer_name != row[:name]
    customer_name = row[:name]
    puts customer_name
  end
  puts "  #{row[:description]} #{row[:price]}"
end




DB.disconnect
