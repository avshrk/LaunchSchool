initial_array = Array(1..9)
p initial_array
second_array = []
initial_array.each do |element|
  second_array << element + 2
end
p second_array
