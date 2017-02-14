require 'sequel'
require 'byebug'

# select description , count(customer_id) from services left join customers_services on service_id = services.id
# group by description having count(customer_id) >= 3 ;

DB = Sequel.postgres('billing2', host: 'localhost')

services = DB[:services]

services
  .select(:description, Sequel.function(:count,:customer_id))
  .left_join(:customers_services,service_id: :id)
  .group(:description)
  .having{ count(customer_id) >= 3 }
  .each{ |row| puts "#{row[:description]}, #{row[:count]}" }

DB.disconnect
