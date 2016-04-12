

def take_block (num,&block)
  block.call(num)
end

n = 99

take_block (n) do |nm |
  puts "the number is #{nm}"
end
