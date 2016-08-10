

puts 5.times { |num| puts num }


def times(number)
 if block_given?
   i = 0
   loop do
     break if i == number
     yield i
     i += 1
   end
   i
 end
end

puts '---------------'

puts times(5) { |num| puts num }
