require 'yaml'
require 'pry'

MSGS = YAML.load_file('calculator_msgs.yml')

LANG = 'en'.freeze
ADD = '1'.freeze
SUB = '2'.freeze
MUL = '3'.freeze
DIV = '4'.freeze

def prompt(msg)
  puts "=> " + messages(msg, LANG)
end

def valid_number?(num)
  integer?(num) || float?(num)
end

def integer?(n)
  Integer(n) rescue false
end

def float?(n)
  Float(n) rescue false
end

def operation_to_msg(op)
  msg = case op
        when ADD
          'add'
        when SUB
          'sub'
        when MUL
          'mul'
        when DIV
          'div'
        end
  msg
end

def calculate(op, number_1, number_2)
  return 'Infinity' if number_2.to_i == 0
  case op
  when ADD
    number_1.to_i + number_2.to_i
  when SUB
    number_1.to_i - number_2.to_i
  when MUL
    number_1.to_i * number_2.to_i
  when DIV
    number_1.to_f / number_2.to_f
  end
end

def messages(msg, lang = 'en')
  MSGS[lang][msg]
end

prompt 'welcome'
prompt 'ask_name'
name = ''

loop do
  name = gets.chomp
  break unless name.empty?
  prompt 'empty'
end

loop do
  number_1 = ''

  loop do
    prompt 'first_num'
    number_1 = gets.chomp
    break if valid_number? number_1
    prompt 'valid_number'
  end

  number_2 = ''
  loop do
    prompt 'second_num'
    number_2 = gets.chomp
    break if valid_number? number_2
    prompt 'valid_number'
  end

  prompt 'operator_prompt'
  operator = ''

  loop do
    operator = gets.chomp
    break if %w(1 2 3 4).include? operator
    prompt 'must_choose'
  end

  prompt operation_to_msg(operator)

  prompt "result"
  puts calculate(operator, number_1, number_2)
  prompt 'another'
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
