VALID_CHOICES = { 'ro' => 'rock', 'pa' => 'paper', 'sc' => 'scissors', 'sp' => 'spock', 'li' => 'lizard' }.freeze
WINNERS = { ro: %w(sc li), pa: %w(ro sp), sc: %w(pa li), li: %w(pa sp), sp: %w(ro sc) }.freeze
PLAYER = 1
COMPUTER = 2
TIE = 0

def display_results(winner)
  case winner
  when TIE
    prompt("It is a tie.")
  when PLAYER
    prompt("You won.")
  when COMPUTER
    prompt("Computer won.")
  end
end

def display_choices
  msg = ''
  VALID_CHOICES.each_pair do |k, v|
    msg += ' ' + k + ' for ' + v + ','
  end
  prompt(msg.chop + ' : ')
end

def prompt(msg)
  puts "==> #{msg}"
end

def beats(player, computer)
  return TIE if player == computer
  WINNERS[player.to_sym].include?(computer) ? PLAYER : COMPUTER
end

def valid?(choice)
  VALID_CHOICES.key?(choice)
end

def choice
  choice = ''
  loop do
    display_choices
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

def rock_lizard_spock_paper_scissors_v2
  loop do
    user_choice = choice
    computer_choice = VALID_CHOICES.keys.sample

    prompt("You chose #{VALID_CHOICES[user_choice]};  computer chose #{VALID_CHOICES[computer_choice]} ")
    winner = beats(user_choice, computer_choice)
    display_results(winner)

    break unless continue?
  end
end

rock_lizard_spock_paper_scissors_v2
