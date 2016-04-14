require 'pry'
binding.pry

puts "Welcome to calculator"
puts "Please enter the first number:"
number_1 = gets.chomp

puts "Please enter the second number:"
number_2 = gets.chomp

puts "What operation would you like to perform ?\n1) Add \n2) Subtract \n3) Muliply \n4) Divide"
operation = gets.chomp

if operation == '1'
  result = number_1.to_i + number_2.to_i
elsif operation == '2'
  result = number_1.to_i - number_2.to_i
elsif operation == '3'
  result = number_1.to_i* number_2.to_i
elsif operation == '4'
  result = number_1.to_f / number_2.to_f
else
  puts "Incorrect option"

end


puts "The result is #{result}"
