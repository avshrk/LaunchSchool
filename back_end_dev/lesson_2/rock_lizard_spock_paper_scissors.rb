VALID_CHOICES = %w(rock paper scissors spock lizard).freeze
WINNERS = { rock: %w(scissors lizard), paper: %w(rock spock), scissors: %w(paper lizard), lizard: %w(paper spock), spock: %w(rock scissors) }.freeze
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
  WINNERS[player.to_sym].include?(computer) ? USER : COMPUTER
end

def continue?
  prompt("Do you want to play again ? (y/n)")
  gets.chomp.downcase.start_with?('y')
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

def rock_lizard_spock_paper_scissors
  loop do
    user_choice = choice
    computer_choice = VALID_CHOICES.sample
    prompt("You chose #{user_choice};  computer chose #{computer_choice} ")
    winner = beats(user_choice, computer_choice)
    display_results(winner)
    break unless continue?
  end
end

rock_lizard_spock_paper_scissors
