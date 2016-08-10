

def yielding(str)
  puts "before #{str}"
  if block_given?
   up =  yield(str)
  else
    puts str
  end
  puts "after #{up}"
end



yielding('hello')
puts '-------------------'

yielding('hello') do |st|
 st.upcase
end


