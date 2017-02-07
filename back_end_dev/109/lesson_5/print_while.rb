numbers = []

while numbers.size < 5
	numbers << rand(0..99)
	puts numbers.last
end
