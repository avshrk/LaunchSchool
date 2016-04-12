require 'byebug'
# byebug
a = ['white snow', 'winter wonderland', 'melting ice','slippery sidewalk', 'salted roads', 'white trees']
new_a = Array.new
a.map do |word|
  each_word = word.split(' ')
  new_a << each_word
end
 new_a.flatten!
 p new_a
