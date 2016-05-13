ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

p ages.key?('spot')
p ages.include?('spot')
p ages.member?('spot')

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }


p ages.values.reduce(:+)
p ages.values.inject(:+)
p ages.values.inject { |sum, n| sum + n }
p ages.values.reduce { |sum, n| sum + n }

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

p ages.delete_if{ |_,v| v > 100 }
p ages.keep_if{ |_,v| v < 100 }
munsters_description = "The Munsters are creepy in a good way."

p munsters_description.capitalize
p munsters_description.swapcase
p munsters_description.downcase
p munsters_description.upcase
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }

additional_ages.each_pair{ |k, v| ages[k] = v }

p ages

p ages.merge!(additional_ages)

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

p ages.min
p ages.values.min
advice = "Few things in life are as important as house training your pet dinosaur."


puts advice.include?('house')
puts advice.match('pet')
puts advice.include?('Dino')
p advice.match('Dino')
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

puts flintstones
p flintstones

puts flintstones.index('Betty')
puts flintstones.index{ |name| name[0,2] == 'Be' }
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

puts flintstones.map!{ |name| name[0,3] }
