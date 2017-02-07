process_the_loop = [true, false].sample

if process_the_loop

	loop do
		puts "Loop was processed"
		break
	end
else
	puts "Loop was not processed"
end
