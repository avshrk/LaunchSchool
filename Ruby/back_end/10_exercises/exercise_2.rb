

ary = Array (1..10)

ary.each do |v|
 puts v if v > 5
end

puts ary.select { |e| e > 5 }
