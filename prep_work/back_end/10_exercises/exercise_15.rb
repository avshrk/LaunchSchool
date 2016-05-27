arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']

p arr
arr.delete_if { |el| el.downcase.start_with?('s') }
p arr

puts '-------------------------'


arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']

p arr
arr.delete_if { |elm| elm.downcase.start_with?('s','w') }
p arr
