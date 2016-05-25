

puts 'Enter a string:'
str = gets.chomp

def all_caps(str)
  if str.length > 10
    return str.upcase
  else
    return str
  end
end


puts all_caps(str)
