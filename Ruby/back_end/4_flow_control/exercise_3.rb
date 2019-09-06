puts 'Write a number between 0 and 100:'
number = gets.chomp.to_i

if number < 0
  puts 'Less than 0'
elsif number >= 0 && number < 51
  puts 'Between 0 and 50'
elsif number > 50 && number < 101
  puts 'Between 51 and 100'
else
  puts 'Greater than 100'
end

