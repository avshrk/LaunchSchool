require 'yaml'
require 'pry'
require 'byebug'

MSGS = YAML.load_file('calculator_msgs.yml')

LANG = 'en'.freeze
ADD = '1'.freeze
SUB = '2'.freeze
MUL = '3'.freeze
DIV = '4'.freeze

def prompt(msg)
  puts "=> " << msg
end

def integer?(n)
  Integer(n)
rescue
  false
end

def float?(n)
  Float(n)
rescue
  false
end

def valid_number?(n)
  return false if n.empty?
  integer?(n) || float?(n)
end

def operation_to_msg(op)
  case op
  when ADD
    'add'
  when SUB
    'sub'
  when MUL
    'mul'
  when DIV
    'div'
  end
end

def calculate(number_1, number_2, op)
  case op
  when ADD
    number_1.to_i + number_2.to_i
  when SUB
    number_1.to_i - number_2.to_i
  when MUL
    number_1.to_i * number_2.to_i
  when DIV
    number_2.to_i == 0 ? 0 : number_1.to_f / number_2.to_f
  end
end

def messages(msg, lang = 'en')
  MSGS[lang][msg]
end

def user_name
  prompt messages('ask_name')
  name = nil
  loop do
    name = gets.chomp
    break unless name.empty?
    prompt messages('empty')
  end
  name
end

def number(message)
  prompt message
  number = nil
  loop do
    number = gets.chomp
    break if valid_number?(number)
    prompt messages('valid_number')
  end
  number
end

def operation_to_perform
  prompt messages('operator_prompt')
  operator = ''
  loop do
    operator = gets.chomp
    break if %w(1 2 3 4).include? operator
    prompt messages('must_choose')
  end
  operator
end

def continue?
  prompt messages('another')
  gets.chomp.downcase.start_with?('y')
end

def display_greetings
  prompt messages('welcome')
  name = user_name
  prompt messages('hi') + name
end

def calculator
  display_greetings
  loop do
    first_number = number(messages('first_num'))
    second_number = number(messages('second_num'))
    operator = operation_to_perform
    prompt messages(operation_to_msg(operator))
    result = calculate(first_number, second_number, operator)
    prompt messages("result") + result.to_s
    break unless continue?
  end
end

calculator
