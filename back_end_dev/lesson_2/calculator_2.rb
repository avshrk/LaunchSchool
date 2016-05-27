require 'byebug'
require 'pry'



def calculator
  puts 'Lesson 2 : Calculator Program'
  puts 'Please enter the first number:'
  first_number = gets.chomp

  puts 'Please enter the second number:'
  second_number = gets.chomp

  puts "Please type an operation to be performed."
  puts "Add, Subtract, Multiply or Divide"
  operation = gets.chomp.capitalize

  result =  case operation
            when 'Add'
              first_number.to_i + second_number.to_i
            when 'Subtract'
              first_number.to_i - second_number.to_i
            when 'Multiply'
              first_number.to_i * second_number.to_i
            when 'Divide'
              first_number.to_f / second_number.to_f
            else
              nil
            end
  puts "The result is #{result}"
end


calculator
