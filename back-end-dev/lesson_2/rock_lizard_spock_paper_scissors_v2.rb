VALID_CHOICES = {'ro' => 'rock','pa' => 'paper','sc'=> 'scissors','sp'=> 'spock','li'=> 'lizard'}
WINNERS = { ro: %w(sc li), pa:%w(ro sp) , sc: %w(pa li), li: %w(pa sp), sp: %w(ro sc) }
PLYR = 1
CMPTR = 2
TIE = 0

def display_results(winner)
  case winner
  when TIE
    prompt("It is a tie.")
  when PLYR
    prompt("You won.")
  when CMPTR
    prompt("Computer won.")
  end
end

def display_choices
  msg = ''
  VALID_CHOICES.each_pair do |k,v|
    msg += ' ' + k + ' for ' + v  + ','
  end
  prompt( msg.chop + ' : ')
end

def prompt(msg)
  puts "==> #{msg}"
end

def beats(player, computer)
  return TIE if player == computer
  WINNERS[player.to_sym].include?(computer) ? PLYR : CMPTR
end

loop do
  choice = ''
  loop do
    # prompt("Choose one:  #{VALID_CHOICES.join(',  ')} : ")
    display_choices
    choice = gets.chomp.downcase
    break if VALID_CHOICES.has_key?(choice)
    prompt("Invalid choice.")
  end

  computer_choice = VALID_CHOICES.keys.sample

  prompt("You chose #{VALID_CHOICES[choice]};  computer chose #{VALID_CHOICES[computer_choice]} ")
  winner = beats(choice, computer_choice)
  display_results(winner)

  prompt("Do you want to play again ? (y/n)")
  break unless gets.chomp.downcase.start_with?('y')
end
