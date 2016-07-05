# Q1
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" }
}
total = 0

munsters.each do |member, info|
  total += info['age'] if info['gender'] = 'male'
end
puts total

puts '-' * 80
# Q2
munsters.each do |member, info|
  puts "#{member} is a #{info['age']} year old #{info['gender']}."
end
puts '-' * 80
# Q3
def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

puts '-' * 80

def not_so_tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]

  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = not_so_tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

puts '-' * 80
# Q4
sentence = "Humpty Dumpty sat on a wall."

puts sentence.chomp('.').split.reverse.join(' ') + '.'
puts sentence.split(/\W/).reverse.join(' ') + '.'
puts '-' * 80
# Q6
































