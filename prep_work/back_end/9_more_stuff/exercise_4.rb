def execute(&b)
  b
end
def execute2(&b)
  b.call
end



return_ex1 = execute { puts "Hello from inside the execute method!" }
return_ex2 = execute2 { puts "Hello from inside the execute method!" }
p return_ex1
p return_ex2
return_ex1.call
