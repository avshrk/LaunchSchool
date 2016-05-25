

loop do
  puts "Enter number to get squared: "
  x = gets.chomp.to_i
  puts x * x
  puts "C to continue, S to stop"
  char = gets.chomp.upcase
  if char == 'S'
    break
  end
end
