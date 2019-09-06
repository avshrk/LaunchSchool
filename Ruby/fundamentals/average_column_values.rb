require 'sequel'
require 'byebug'

puts "What database do you want to use ?"
database_name = gets.chomp
puts "What table do you want to use ?"
table_name = gets.chomp.to_sym

DB = Sequel.postgres(database_name, host: 'localhost')

table_columns = DB[table_name].columns
table_columns.each do |column|
  begin
    avg = DB[table_name].avg(column)
    puts "#{column}: #{avg}"
  rescue Sequel::DatabaseError
  end
end


DB.disconnect
