arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']

puts arr
puts '-------------------------'
arr.delete_if { |el| el.downcase.start_with?('s') }
puts arr



arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']


arr.delete_if { |elm| elm.downcase.start_with?('s','w') }
puts '-------------'
puts arr
