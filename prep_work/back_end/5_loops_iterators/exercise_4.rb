puts 'Give me a number to countdown:'
number = gets.chomp.to_i

def count_down(number)
  return nil if number < 0
  puts number
  count_down(number - 1)
end


count_down(number)
