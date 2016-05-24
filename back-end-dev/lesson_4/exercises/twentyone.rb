require 'byebug'
require 'pry'

SUITS = ['H', 'D', 'S', 'C'].freeze
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10'] +
         ['J', 'Q', 'K', 'A'].freeze

ACE = 'A'.freeze
FACE_CARD = 10
ACE_MAX = 11
WINNING_POINT = 21
LOWER_BOUND = 17
ACE_GAP = 10
ROUND = 2
WAIT_TIME = 9

def initialize_deck
  SUITS.product(VALUES).shuffle
end

def prompt(str)
  puts "=> #{str}"
end

def system_clear
  system('clear') || system('cls')
end

def face_card?(card)
  card[1].to_i == 0
end

def ace_card?(card)
  card[1] == ACE
end

def ace_count(cards)
  cards.flatten.count(ACE)
end

def get_card_value(card)
  return ACE_MAX if ace_card?(card)
  return FACE_CARD if face_card?(card)
  card[1].to_i
end

def adjust_aces(cards, cards_sum)
  ace_count = ace_count(cards)
  ace_count.times do
    cards_sum -= ACE_GAP
    return cards_sum if cards_sum <= WINNING_POINT
  end
  cards_sum
end

def calculate_hand(cards)
  total_card_value = 0
  cards.each do |each_card|
    total_card_value += get_card_value(each_card)
  end
  return total_card_value unless ace_exist?(cards)
  return total_card_value if total_card_value <= WINNING_POINT
  adjust_aces(cards, total_card_value)
end

def display_cards(cards)
  cards.map { |card| card[1] }.join(' ')
end

def valid?(choices, given)
  choices.include?given
end

def joinor(list, delimiter = ',', conjunction = 'or')
  join_list = list.clone
  join_list[-1] = " #{conjunction} " + join_list.last.to_s if join_list.size > 1
  join_list.join(delimiter)
end

def inquire_player(message, valid_choices)
  prompt message
  answer = ''
  loop do
    answer = gets.chomp.downcase
    break if valid?(valid_choices, answer)
    prompt "It is not a valid choice."
    prompt "Please type : #{joinor(valid_choices)}"
  end
  answer
end

def start_over
  print 'Starting over'
  passed_seconds = 0
  left_time = WAIT_TIME
  WAIT_TIME.times do
    print " #{left_time - passed_seconds}"
    sleep(1)
    passed_seconds += 1
  end
end

def stay?
  message = "Would you like to stay or hit ? ( stay/hit )"
  answer =  inquire_player(message, ['stay', 'hit'])
  answer == 'stay'
end

def busted?(hand)
  calculate_hand(hand) > WINNING_POINT
end

def dealer_stops?(hand)
  hand_value = calculate_hand(hand)
  hand_value >= LOWER_BOUND && hand_value <= WINNING_POINT
end

def play_again?
  message = "Would you like to play again ? (yes,no)"
  answer = inquire_player(message, ['yes', 'no'])
  answer == 'yes'
end

def hide_dealer_first_card(cards)
  [['Hidden', 'Hidden'], cards[1]]
end

def ace_exist?(cards)
  cards.flatten.include?(ACE)
end

def player_won?(player_cards, dealer_cards)
  return true if busted?(dealer_cards)
  calculate_hand(player_cards) > calculate_hand(dealer_cards)
end

def tie?(player_cards, dealer_cards)
  calculate_hand(player_cards) == calculate_hand(dealer_cards)
end

def dealers_turn(hand, deck)
  prompt "Dealers Turn : "
  prompt display_cards(hand)
  loop do
    break if busted?(hand) || dealer_stops?(hand)
    hand << deal_card(deck)
    prompt display_cards(hand)
    sleep(1)
  end
end

def players_turn(player_hand, deck)
  loop do
    break if busted?(player_hand) || stay?
    player_hand << deal_card(deck)
    prompt display_cards(player_hand)
  end
end

def display_winner(player_hand, dealer_hand, rounds)
  puts ''
  if tie?(player_hand, dealer_hand)
    prompt "It is a tie!"
  elsif player_won?(player_hand, dealer_hand)
    prompt "You Won!!"
    rounds[:player] += 1
  else
    prompt "Dealer Won!! "
    rounds[:dealer] += 1
  end
  puts ''
  prompt "Dealer:#{calculate_hand(dealer_hand)}"
  prompt "You:#{calculate_hand(player_hand)}"
  puts ''
end

def deal_card(deck)
  deck.pop
end

def deal_hand(hand, deck)
  2.times { hand << deal_card(deck) }
end

def display_game_winner(rounds)
  puts ''
  prompt 'Game Over'
  if rounds[:player] > rounds[:dealer]
    prompt "You won the Game "
  else
    prompt "Dealer won the Game"
  end
  prompt "#{rounds.values.max} to  #{rounds.values.min}"
  puts ''
end

def display_current_game_score(rounds)
  prompt "Current Game Score"
  prompt "You:#{rounds[:player]}, Dealer:#{rounds[:dealer]}\n"
  puts ''
end

# rubocop:disable Metrics/MethodLength, Metrics/AbcSize:
def twenty_one
  rounds = { player: 0, dealer: 0 }
  loop do
    system_clear
    player_hand = []
    dealer_hand = []
    prompt "Lets Play Black Jack"
    display_current_game_score(rounds)

    deck = initialize_deck
    deal_hand(player_hand, deck)
    deal_hand(dealer_hand, deck)
    prompt "Your Hand:"
    prompt display_cards(player_hand)
    puts ''
    prompt "Dealer's Hand:"
    prompt display_cards(hide_dealer_first_card(dealer_hand))
    puts ''
    players_turn(player_hand, deck)

    if busted?(player_hand)
      prompt "Busted!"
      prompt "Dealer's Hand:"
      prompt display_cards(dealer_hand)
    else
      prompt "You chose to stay. Your Total: #{calculate_hand(player_hand)}"
      dealers_turn(dealer_hand, deck)
    end

    display_winner(player_hand, dealer_hand, rounds)

    if rounds.values.include?(ROUND)
      display_game_winner(rounds)
      break unless play_again?
      rounds[:player] = 0
      rounds[:dealer] = 0
    end

    start_over
  end
end
# rubocop:enable Metrics/MethodLength, Metrics/AbcSize:
#

twenty_one
