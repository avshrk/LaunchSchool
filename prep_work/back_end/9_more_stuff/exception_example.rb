

names = [ 'joe','jane','john',nil,'bob']


names.each do |n|
  begin
    puts n.length
  rescue
    puts 'error happened'
  end
end
