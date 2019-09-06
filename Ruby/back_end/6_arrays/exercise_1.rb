arr = [1, 3, 5, 7, 9, 11]
number = 3

puts arr.include?(number)

arr.each do |element|
  if element == number
    puts 'included'
  end
end
