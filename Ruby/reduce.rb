require 'byebug'

def reduce(ary,default = 0)
  accum = default
  counter = 0

  while counter < ary.size
    accum = yield(accum, ary[counter])
    counter +=1
  end
  accum
end


ary = *(1..5)
puts reduce(ary) { |acc,num| acc + num }
puts reduce(ary,10) { |acc,num| acc + num }
puts reduce(ary) { |acc,num| acc - num }
puts reduce(ary) { |acc,num| acc + num if num.odd? }

