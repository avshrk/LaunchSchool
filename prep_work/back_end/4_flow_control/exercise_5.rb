
puts 'Write a number between 0 and 100:'
number = gets.chomp.to_i

def number_range_with_if(number)
  if number < 0
    'Less than 0'
  elsif number >= 0 && number < 51
    'Between 0 and 50'
  elsif number > 50 && number < 101
    'Between 51 and 100'
  else
    'Greater than 100'
  end
end

def number_range_with_case(number)
  case
  when number < 0
    'Less than 0'
  when number >= 0 && number < 51
    'Between 0 and 50'
  when number > 50 && number < 101
    'Between 51 and 100'
  else
    'Greater than 100'
  end
end

puts number_range_with_if(number)

puts number_range_with_case(number)

