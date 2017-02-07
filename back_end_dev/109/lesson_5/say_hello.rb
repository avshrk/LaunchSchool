say_hello = true
counter = 0

while say_hello
	counter += 1
	puts 'Hello!'
	say_hello = false if counter == 5
end
