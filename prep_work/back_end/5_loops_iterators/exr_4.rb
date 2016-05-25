

puts "Enter a number to countdown:"

x = gets.chomp.to_i


def count_down(x)
  if x == 0
    x
  else
    puts x
   return count_down(x-1)
  end
end


puts count_down(x)
