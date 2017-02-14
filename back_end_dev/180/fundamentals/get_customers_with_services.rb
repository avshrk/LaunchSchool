require 'sequel'
require 'byebug'


DB = Sequel.postgres('billing2', host: 'localhost')

DB[:customers]
  .select(:customers__id, :name, :payment_token)
  .distinct
  .join(:customers_services,customer_id: :id)
  .each do |row|
  puts "(#{row[:id]}, \"#{row[:name]}\", #{row[:payment_token]})"
end

DB.disconnect

