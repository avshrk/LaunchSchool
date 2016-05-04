VALID_CHOICES = { 'ro' => 'rock', 'pa' => 'paper', 'sc' => 'scissors', 'sp' => 'spock', 'li' => 'lizard' }
WINNERS = { ro: %w(sc li), pa: %w(ro sp), sc: %w(pa li), li: %w(pa sp), sp: %w(ro sc) }
PLYR = 1
CMPT = 2
TIE = 0

def display_results(winner)
  case winner
  when TIE
    prompt("It is a tie.")
  when PLYR
    prompt("You won.")
  when CMPT
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
  WINNERS[user.to_sym].include?(computer) ? PLYR : CMPT
end

def count(plyrs, winner)
  plyrs[winner] += 1
end

players = []
players[TIE] = 0
players[PLYR] = 0
players[CMPT] = 0

loop do
  choice = ''
  loop do
    display_choices
    choice = gets.chomp.downcase
    break if VALID_CHOICES.key?(choice)
    prompt("Invalid choice.")
  end

  computer_choice = VALID_CHOICES.keys.sample

  prompt("You chose #{VALID_CHOICES[choice]};  computer chose #{VALID_CHOICES[computer_choice]} ")
  winner = beats(choice, computer_choice)
  count(players, winner)

  display_results(winner)
  break if players[PLYR] == 5 || players[CMPT] == 5
end
prompt("Game Over")
prompt("Score ==> You:#{players[PLYR]} | Computer:#{players[CMPT]}")
