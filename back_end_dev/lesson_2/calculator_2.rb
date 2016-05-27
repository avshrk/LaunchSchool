require 'byebug'
require 'pry'

def prompt(message)
  puts '=> ' << message
end

def valid?(number)
  number.to_i != 0
end

def user_name
  name = ''
  loop do
    prompt 'Enter your name'
    name = gets.chomp
    break unless name.empty?
    prompt 'Please enter a name.'
  end
  name
end

def greetings
  prompt 'Lesson 2 : Calculator Program'
  prompt 'Welcome to Calculator'
  name = user_name
  prompt "Hi #{name}"
end

def receive_number
  number = ''
  loop do
    number = gets.chomp
    break if valid?(number)
    prompt 'It is not a valid number.'
    prompt 'Please enter a valid number.'
  end
  number
end

def perform_operation(first_number, second_number, operator)
  case operator
  when '1'
    first_number.to_i + second_number.to_i
  when '2'
    first_number.to_i - second_number.to_i
  when '3'
    first_number.to_i * second_number.to_i
  when '4'
    first_number.to_f / second_number.to_f
  end
end

def another_operation?
  prompt 'Do you want to perform another calculation ? (y/n)'
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

def choose_operator
  operator = ''
  loop do
    operator = gets.chomp
    break if %w( 1 2 3 4 ).include?(operator)
    prompt 'You must choose 1, 2, 3, or 4'
  end
  operator
end

def operation_to_message(operation)
  case operation
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

def prompt_operator_msg
  msg = <<-MSG
    What operation would you like to perform ?
        1) Add
        2) Subtract
        3) Multiply
        4) Divide
  MSG
  msg
end

def calculator
  greetings
  loop do
    prompt 'Please enter the first number'
    first_number = receive_number

    prompt 'Please enter the second number:'
    second_number = receive_number

    prompt_operator_msg
    operator = choose_operator
    prompt "#{operation_to_message(operator)} the two numbers..."
    result = perform_operation(first_number, second_number, operator)

    prompt "The result is #{result}"
    break unless another_operation?
  end
  prompt 'Goodbye'
end

calculator
