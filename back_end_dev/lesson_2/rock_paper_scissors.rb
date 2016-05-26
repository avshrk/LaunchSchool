VALID_CHOICES = %w(rock paper scissors).freeze
WINNERS = { rock: 'scissors', paper: 'rock', scissors: 'paper' }.freeze

def display_results(winner)
  case winner
  when 0
    prompt("It is a tie.")
  when 1
    prompt("You won.")
  when 2
    prompt("Computer won.")
  end
end

def prompt(msg)
  puts "==> #{msg}"
end

def beats(player, computer)
  return 0 if player == computer
  WINNERS[player.to_sym] == computer ? 1 : 2
end

loop do
  choice = ''
  loop do
    prompt("Choose one:  #{VALID_CHOICES.join(', ')} : ")
    choice = gets.chomp.downcase
    break if VALID_CHOICES.include?(choice)
    prompt("Invalid choice.")
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose #{choice};  computer chose #{computer_choice} ")
  winner = beats(choice, computer_choice)
  display_results(winner)

  prompt("Do you want to play again ? (y/n)")
  break unless gets.chomp.downcase.start_with?('y')
end