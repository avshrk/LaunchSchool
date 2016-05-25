

puts 'Enter a number from 0 to 100:'

num = gets.chomp.to_i

def which_half(num)
  if num < 51
    puts 'Number is between 0 to 50'
  elsif num > 100
    puts 'Number is more than 100'
  else
    puts 'Number is between 51 to 100'
  end
end


puts which_half(num)
