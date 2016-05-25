

pr = Proc.new do |num|
  puts "Number is #{num} "
end

def take_proc(proc)
  [1,2,3,4,5].each do |i|
    proc.call i
  end

end

take_proc(pr)
