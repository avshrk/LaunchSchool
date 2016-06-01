VALID_CHOICES = %w(rock paper scissors).freeze
WINNERS = { rock: 'scissors', paper: 'rock', scissors: 'paper' }.freeze
TIE = 0
USER = 1
COMPUTER = 2

def display_results(winner)
  case winner
  when TIE
    prompt("It is a tie.")
  when USER
    prompt("You won.")
  when COMPUTER
    prompt("Computer won.")
  end
end

def prompt(msg)
  puts "==> #{msg}"
end

def beats(player, computer)
  return TIE if player == computer
  WINNERS[player.to_sym] == computer ? USER : COMPUTER
end

def valid?(choice)
  VALID_CHOICES.include?(choice)
end

def choice
  choice = ''
  loop do
    prompt("Choose one:  #{VALID_CHOICES.join(', ')}  ")
    choice = gets.chomp.downcase
    break if valid?(choice)
    prompt("Invalid choice.")
  end
  choice
end

def continue?
  prompt("Do you want to play again ? (y/n)")
  gets.chomp.downcase.start_with?('y')
end

def rock_paper_scissors
  loop do
    user_choice = choice
    computer_choice = VALID_CHOICES.sample
    prompt("You chose #{user_choice};  computer chose #{computer_choice} ")
    display_results(beats(user_choice, computer_choice))
    break unless continue?
  end
end

rock_paper_scissors
