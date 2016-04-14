
def prompt(msg)
  puts "=> " + msg
end

def valid_number?(num)
  num.to_i != 0
end

def operation_to_msg(op)
  case op
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

prompt "Welcome to calculator! What is your name?"
name = ''

loop do
  name = gets.chomp
  break unless name.empty?
  prompt 'It is empty! Please enter a valid name.'
end

loop do
  number_1 = ''

  loop do
    prompt "Please enter the first number:"
    number_1 = gets.chomp
    break if valid_number? number_1
    prompt "It is not a valid number."
  end

  number_2 = ''
  loop do
    prompt "Please enter the second number:"
    number_2 = gets.chomp
    break if valid_number? number_2
    prompt "It is not a valid number."
  end

  operator_prompt = <<-MSG
  What operation would you like to perform ?
    1) Add
    2) Subtract
    3) Multiply
    4) Divide
  MSG
  operator = ''
  prompt operator_prompt

  loop do
    operator = gets.chomp
    break if %w(1 2 3 4).include? operator
    prompt 'Must choose 1, 2, 3, or 4'
  end

  prompt "#{operation_to_msg(operator)} the two numbers..."

  result = case operator
           when '1'
             number_1.to_i + number_2.to_i
           when '2'
             number_1.to_i - number_2.to_i
           when '3'
             number_1.to_i * number_2.to_i
           when '4'
             number_1.to_f / number_2.to_f
           end

  prompt "The result is #{result}"
  prompt "Do you want to perform another calculation? (y to continue)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
