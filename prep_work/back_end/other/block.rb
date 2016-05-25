

def take_block(&b)
  b.call
end


take_block do
  puts 'from within the block'
end

