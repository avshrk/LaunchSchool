

def divide(a,b)
  begin
    a / b
  rescue ZeroDivisionError => e
    puts e.message
  end
end


puts divide(10.2,11.4)
puts divide(0,2)
puts divide(2,0)
puts divide(1.3,2)
