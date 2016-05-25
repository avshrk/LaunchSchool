greet = { :a => 'hi' }
puts 'greet ' + greet.object_id.to_s

greet_informal = greet[:a]
puts 'greet_informal ' + greet_informal.object_id.to_s

greet_informal << ' there'
puts greet_informal

puts 'greet_informal ' + greet_informal.object_id.to_s
puts greet
puts 'greet ' + greet.object_id.to_s

puts '-' * 80

def mess_with_vars(one,two,three)
  one.gsub!('1','none')
  two.gsub!('2','none')
  three.gsub!('3','none')
end


one = '1'
two = '2'
three = '3'

mess_with_vars(one, two, three)

puts 'one ' + one
puts 'two ' + two
puts 'three ' + three


puts '-' * 80

def gen_UUID
  nums = []
  (0..9).each { |n| nums << n.to_s }
  ('a'..'f').each { |n| nums << n }
  uuid = ''
  format = [8,4,4,4,12]
  format.each_with_index do |v,i|
    v.times {  uuid += nums.sample }
    uuid += '-' if  i < format.size - 1
  end
  uuid
end

puts gen_UUID

puts '-' * 80

def is_a_number?(num)
  true
end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false if dot_separated_words.size != 4
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false  if !is_a_number?(word)
    return false if word.to_i > 255 || word.to_i < 0
  end
  true
end


puts dot_separated_ip_address?('10.22.33')
puts dot_separated_ip_address?('10.22.33.33')
puts dot_separated_ip_address?('10.22.33.')


