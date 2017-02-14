require 'sequel'
require 'byebug'

# select sum(price) from customers_services left join services on service_id = services.id

DB = Sequel.postgres('billing2', host: 'localhost')

customers_services = DB[:customers_services]

customers_services
  .select{sum(price).cast(:money)}
  .left_join(:services,id: :service_id)
  .each { |row| puts row[:sum] }

DB.disconnect
