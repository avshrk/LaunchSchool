
puts 'Guessing Game'
stop = ''

while stop != 'STOP'
  puts 'Guess a number between 1 and 10 ? '
  answer = gets.chomp
  number = *(1..10)
  puts 'You guessed ' << answer
  puts 'The number is ' << number.sample.to_s
  puts 'Type STOP to quit the program. Any key to continue'
  stop = gets.chomp
end
