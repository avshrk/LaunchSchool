require 'sequel'
require 'byebug'


DB = Sequel.postgres('billing2', host: 'localhost')

DB[:customers]
  .select(:customers__id, :name, :payment_token)
  .left_join(:customers_services,customer_id: :id)
  .group(:customers__id, :service_id)
  .where(service_id: nil)
  .each do |row|
  puts "(#{row[:id]}, \"#{row[:name]}\", #{row[:payment_token]})"
end

DB.disconnect

