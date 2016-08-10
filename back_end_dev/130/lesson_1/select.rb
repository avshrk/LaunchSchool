require 'byebug'

def select(ary)
  result_ary = []
  counter = 0
  while counter < ary.size
    result_ary << ary[counter] if yield ary[counter]
    counter += 1
  end
  result_ary
end


ar = *(1..5)

rs =  select(ar) { |num| num.odd? }

# rs =  select(ar) { |num| puts num }
# rs =  select(ar) { |num|  num + 1  }
puts '-----'
puts rs
