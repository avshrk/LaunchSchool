

puts 'Enter a number'

num = gets.chomp.to_i

def what_is_the_range(num)
  case
  when num < 0
    puts 'Negative Number'
  when  num < 51
    puts 'Number is between 0 and 50'
  when num > 100
    puts 'Number is bigger than 100'
  else
    puts 'Number is between 51 to 100'
  end
end

puts what_is_the_range(num)
