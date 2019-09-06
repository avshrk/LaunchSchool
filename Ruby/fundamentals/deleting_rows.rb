require 'sequel'
require 'byebug'

DB = Sequel.postgres('billing2', host: 'localhost')

service = 'Bulk Email'
customer = 'Chen Ke-Hua'

DB[:customers].where(name:customer).delete

service_id = DB[:services].select(:id).where(description: service)
DB[:customers_services].where(service_id: service_id).delete
DB[:services].where(id:service_id).delete

DB[:customers].select.each { |row| puts row  }
puts
DB[:services].select.each { |row| puts row  }
puts
DB[:customers_services].select.each{ |row| puts row  }


DB.disconnect
