

h = { one: 'NY', two: 'LA', three:'CA', four:'WA'}

puts 'Keys'
h.each_key do |k|
  p k
end

puts 'Values'
h.each_value do |v|
  p v
end

puts 'Keys and Values'

h.each_pair do |k,v|
  puts 'key ' + k.to_s + ' and value ' + v.to_s
end


