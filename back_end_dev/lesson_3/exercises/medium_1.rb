# Q1
msg = 'The Flintstones Rock!'
10.times { |n| puts ' ' * n + msg }

puts '-' * 80
# Q2
statement = "The Flintstones Rock"
letter_freqncy = Hash.new(0)
statement.scan(/\w/).each { |ch| letter_freqncy[ch] += 1 }
p letter_freqncy
letter_freqncy = Hash.new(0)
statement.scan(/\w/).each { |ch| letter_freqncy[ch.downcase] += 1 }
p letter_freqncy

puts '-' * 80
# Q3
# puts "the value of 40 + 2 is " + (40 + 2)

puts "the value of 40 + 2 is " + (40 + 2).to_s
puts "the value of 40 + 2 is #{40 + 2}"

puts '-' * 80
# Q4
numbers = [1, 2, 3, 4]
numbers.each do |number|
    p number
      numbers.shift(1)
end

puts '-' * 80

numbers = [1, 2, 3, 4]
numbers.each do |number|
    p number
      numbers.pop(1)
end

puts '-' * 80

numbers = [1, 2, 3, 4]
numbers.each_with_index do |number, index|
    p "#{index}  #{numbers.inspect}  #{number}"
      numbers.shift(1)
end

puts '-' * 80

numbers = [1, 2, 3, 4]
numbers.each_with_index do |number, index|
    p "#{index}  #{numbers.inspect}  #{number}"
      numbers.pop(1)
end

puts '-' * 80

def factors(number)
  return 0 if number == 0
  return nil if number < 0
  dividend = number
  divisors = []
  begin
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end until dividend == 0
  divisors
end

# puts factors(-1)
# puts factors(0)
# puts factors(20)

puts '-' * 80

def factors2(number)
  dividend = number
  divisors = []
  while dividend > 0
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end
  divisors
end

# puts factors2(-1)
# puts factors2(0)
# puts factors2(20)

puts '-' * 80

# Q6
def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size >= max_buffer_size
  buffer
end

a = Array.new(5,'-')
# rolling_buffer1(a,5,'x')
# rolling_buffer1(a,5,'o')
# rolling_buffer1(a,5,'p')
# puts rolling_buffer1(a,5,'a')

puts '-' * 80

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size >= max_buffer_size
  buffer
end
a = Array.new(5,'-')
# puts rolling_buffer2(a,5,'x')
# puts rolling_buffer2(a,5,'o')
# puts rolling_buffer2(a,5,'p')
# puts rolling_buffer2(a,5,'a')


puts '-' * 80

limit = 15

def fib(first_num, second_num,limit)
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end
result = fib(0, 1,limit)
puts "result is #{result}"

puts '-' * 80

def titleize(str)
  str.split(' ').each{ |word| word.capitalize! }.join(' ')
end

def titleize2(words)
  words.split.map { |word| word.capitalize }.join(' ')
end

puts titleize('here is a very important title')
puts titleize2('here is another very important title')

puts '-' * 80

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, info|
  case info['age']
  when 0...17
    info['age_group'] = 'kid'
  when 18...64
    info['age_group'] = 'adult'
  else
    info['age_group'] = 'senior'
  end
end
p munsters

puts '-' * 80




puts '-' * 80
puts
puts
