ary = Array(1..10)

odd_nums = ary.select { |v| v % 2 != 0 }
puts odd_nums
