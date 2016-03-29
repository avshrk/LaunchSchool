
puts 'Enter number'
x = gets.chomp.to_i

def equal_to_four(x)
  if x == 4
    puts 'It is equal'
  else
    puts 'Not equal'
  end
end

puts equal_to_four(x)
