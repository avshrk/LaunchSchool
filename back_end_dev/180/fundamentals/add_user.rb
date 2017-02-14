require 'sequel'
require 'byebug'


DB = Sequel.postgres('billing2', host: 'localhost')

def add_customer(customer_name,payment_token)
  DB[:customers].insert(name:customer_name,payment_token: payment_token)
end

def service_id(service_name)
  DB[:services].select(:id).where(description:service_name).first[:id]
end

def sign_service_customer(customer_id,service_id)
  DB[:customers_services].insert(customer_id: customer_id, service_id: service_id)
end

payment_token = 'EYODHLCN'
customer_name = 'John Doe'
services = %W(Unix\ Hosting DNS Whois\ Registration)


customer_id = add_customer(customer_name, payment_token)

services.each do |service|
  sign_service_customer customer_id, service_id(service)
end

DB[:customers_services]
  .select
  .each { |row| puts row }

DB[:customers]
  .select
  .each { |row| puts row }

DB.disconnect
