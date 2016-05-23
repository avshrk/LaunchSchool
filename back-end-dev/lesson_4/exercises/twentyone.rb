require 'byebug'
require 'pry'

DECK =  { 'Suite' => ['H', 'D', 'C', 'S'],
          'Value' => ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A'] }.freeze
SUITE = 0
VALUE = 1
ACE = 'A'.freeze
FACE_CARD = 10
ACE_ONE =  1
ACE_ELEVEN = 11
FIRST_HAND = 1
TWENTY_ONE = 21
SEVENTEEN = 17
TEN = 10

def prompt(str)
  puts "=> #{str}"
end

def system_clear
  system('clear') || system('cls')
end

def draw_card
  [DECK['Suite'].sample, DECK['Value'].sample]
end

def already_drawn?(pre_draws, new_draw)
  pre_draws.include?(new_draw)
end

def deal_uniq_card(pre_draws)
  new_draw = draw_card
  loop do
    break unless already_drawn?(pre_draws,new_draw)
    new_draw = draw_card
  end
  new_draw
end

def face_card?(card)
  card[VALUE] != card[VALUE].to_i.to_s
end

def numeric_card?(card)
  card[VALUE] == card[VALUE].to_i.to_s
end

def ace_card?(card)
  card[VALUE] == ACE
end

def get_card_value(card)
 return ACE_ONE if ace_card?(card)
 return FACE_CARD if face_card?(card)
 return card[VALUE].to_i
end

def get_highest_sum(cards,cards_sum)
  return cards_sum unless ace_exist?(cards)
  return ( cards_sum + TEN ) <= TWENTY_ONE ? (cards_sum + TEN) : cards_sum
end

def calculate_hand(cards)
  total_card_value = 0
  cards.each do |each_card|
    total_card_value += get_card_value(each_card)
  end
   get_highest_sum(cards, total_card_value)
end

def display_cards(cards)
  hand = ''
  cards.each do |each_card|
    hand += each_card[1].to_s + ' '
  end
  prompt hand
end

def deal_hand(cards,dealt_cards)
  2.times { cards << deal_uniq_card(dealt_cards) }
end

def valid?(choices, given)
  choices.include?given
end

def joinor(list, delimiter = ',', conjunction = 'or')
  join_list = list.clone
  join_list[-1] = " #{conjunction} " + join_list.last.to_s if join_list.size > 1
  join_list.join(delimiter)
end

def inquire_player(message,valid_choices)
  prompt message
  answer = ''
  loop do
    answer = gets.chomp.downcase
    break if valid?(valid_choices, answer)
    prompt "It is not a valid choice."
    prompt "Please type : #{joinor(valid_choices)}"
  end
  return answer
end

def stay?
 answer =  inquire_player("Would you like to stay or hit ? ( stay/hit )", ['stay','hit'])
 answer == 'stay'
end

def busted?(hand)
  calculate_hand(hand) > TWENTY_ONE
end

def dealer_stops?(hand)
  hand_value = calculate_hand(hand)
  (hand_value > 16 && hand_value < 22)
end

def dealer_plays(hand, pre_cards)
  loop do
    break if busted?(hand) || dealer_stops?(hand)
    hand << deal_uniq_card(pre_cards)
    display_cards(hand)
    sleep(1)
  end
end

def play_again?
 answer = inquire_player("Would you like to play again ? (yes,no)", ['yes','no'])
 answer == 'yes'
end

def hide_dealer_first_card(cards)
  [ ['Hidden', cards[0][1] ]]
end

def ace_exist?(cards)
  cards.flatten.include?(ACE)
end

def player_won?(player_cards,dealer_cards)
  return nil if busted?(player_cards)
  return true if busted?(dealer_cards)
  calculate_hand(player_cards) > calculate_hand(dealer_cards)
end

def tie?(player_cards,dealer_cards)
  calculate_hand(player_cards) == calculate_hand(dealer_cards)
end

def dealers_turn(dealer_hand, out_hands)
  loop do
    dealer_plays(dealer_hand, out_hands)
    break if busted?(dealer_hand) || dealer_stops?(dealer_hand)
    display_cards(dealer_hand)
  end
end

def players_turn(player_hand, out_hands)
  loop do
    break if busted?(player_hand) || stay?
    player_hand << deal_uniq_card(out_hands)
    display_cards(player_hand)
  end
end

def display_winner(player_hand,dealer_hand)
  return  "It is a tie!" if tie?(player_hand, dealer_hand)

  if player_won?(player_hand,dealer_hand)
    return  "You Won!!"
  else
    return  "Dealer Won!! "
  end
end

def twenty_one
  loop do

    system_clear
    player_hand = []
    dealer_hand = []

    prompt "Lets Play Black Jack"
    deal_hand(player_hand, player_hand + dealer_hand)
    deal_hand(dealer_hand, player_hand + dealer_hand)
    prompt "Your Cards: "
    display_cards(player_hand)
    prompt "Dealer Card: "
    display_cards(hide_dealer_first_card(dealer_hand))
    prompt "Your turn to play."
    players_turn(player_hand, player_hand + dealer_hand)

    if busted?(player_hand)
      prompt "Busted!!"
      prompt "Your Total : #{calculate_hand(player_hand)}"
      prompt "Dealer Cards:"
      display_cards(dealer_hand)
    else
      prompt "You chose to stay"
      prompt "Your Total : #{calculate_hand(player_hand)}"
      prompt "Dealer Cards:"
      display_cards(dealer_hand)
      dealers_turn(dealer_hand, player_hand + dealer_hand)
    end

    prompt "Dealer's Total : #{calculate_hand(dealer_hand)}"
    prompt display_winner(player_hand,dealer_hand)
    break unless play_again?
  end
end

twenty_one

