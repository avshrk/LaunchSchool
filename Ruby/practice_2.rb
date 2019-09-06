# require 'time'

def time_gap
  t1 = Time.now
  yield if block_given?
  t2 =  Time.now
  puts t2-t1
end



time_gap { puts 'hello world' }
