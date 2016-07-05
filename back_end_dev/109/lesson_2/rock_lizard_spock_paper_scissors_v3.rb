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

def beats(user, computer)
  return TIE if user == computer
  WINNERS[user.to_sym].include?(computer) ? PLAYER : COMPUTER
end

def count(plyrs, winner)
  plyrs[winner] += 1
end

def valid?(choice)
  VALID_CHOICES.include?(choice)
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

def game_over?(players)
  players[PLAYER] == 5 || players[COMPUTER] == 5
end

def display_score(players)
  prompt("Score ==> You:#{players[PLAYER]} | Computer:#{players[COMPUTER]}")
end

def rock_lizard_spock_paper_scissors_v3
  players = Array.new(3, 0)

  loop do
    user_choice = choice
    computer_choice = VALID_CHOICES.keys.sample

    prompt("You chose #{VALID_CHOICES[user_choice]};  computer chose #{VALID_CHOICES[computer_choice]} ")
    winner = beats(user_choice, computer_choice)
    count(players, winner)

    display_results(winner)
    display_score(players)
    break if game_over?(players)
  end
  prompt("Game Over")
end

rock_lizard_spock_paper_scissors_v3
