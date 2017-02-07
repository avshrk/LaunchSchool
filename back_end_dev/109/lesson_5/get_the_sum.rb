loop do
	puts 'What does 2 + 2 equal?'
	answer = gets.chomp.to_i
	if answer.to_i == 4
		puts "That is correct"
		break
	else
		puts "Incorrect, try again"
	end

end
