require 'sequel'
require 'byebug'

# select distinct split_part(name,' ',2) as last_name, split_part(name,' ',1) as first_name   from customers
# inner join customers_services on customer_id = customers.id
# inner join services on service_id = services.id where price >= 15 order by last_name limit 3 ;

DB = Sequel.postgres('billing2', host: 'localhost')

customers = DB[:customers]

customers
  .distinct
  .select(Sequel.function(:split_part,:name,' ',2).as(:last_name), Sequel.function(:split_part,:name,' ',1).as(:first_name))
  .join(:customers_services,customer_id: :id)
  .join(:services,id: :service_id)
  .where{price >= 15}
  .order(:last_name)
  .limit(3)
  .each { |row| puts "#{row[:last_name]}, #{row[:first_name]}"  }


DB.disconnect
