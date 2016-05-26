

puts 'Enter a string:'
str = gets.chomp

def all_caps(str)
    return str.upcase if str.size > 10
    str
end

puts all_caps(str)
