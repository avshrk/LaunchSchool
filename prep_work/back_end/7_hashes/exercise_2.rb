first_hash = { first: 'jan', second: 'feb' }
second_hash = { second: 'march', third: 'april' }
puts 'First Hash'
p first_hash
puts 'Second Hash'
p second_hash
puts 'merge method: first_hash.merge(second_hash) '
p first_hash.merge(second_hash)

puts 'merge! method: first_hash.merge!(second_hash) '
p first_hash.merge!(second_hash)
puts 'First Hash'
p first_hash
puts 'Second Hash'
p second_hash
