a = *('a'..'z')
a.each_with_index do |value, index|
  puts 'Value: ' << value << ' Index: ' << index.to_s
end

