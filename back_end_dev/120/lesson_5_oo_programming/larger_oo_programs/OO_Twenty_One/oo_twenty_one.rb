# frozen_string_literal: true
require_relative 'dealer'
require_relative 'player'

require 'byebug'

class TwentyOne
  DEALER_HAND_DRAW_SLEEP = 3
  GAME_START_SLEEP = 9
  END_OF_TURN_SLEEP = 4
  DOT_SPEED = 1

  def initialize
    @dealer = Dealer.new
    @player = Player.new
    redraw_screen
  end

  def play
    display_welcome
    meet_players
    display_greetings
    timer('Starting The Game', GAME_START_SLEEP)
    redraw_screen
    loop do
      shuffle_cards
      play_deck
      break unless play_again?
    end
    display_goodbye
  end

  def play_again?
    answer = ''
    loop do
      puts "Would you like to play another game? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts 'Invalid Input'
    end
    answer == 'y'
  end

  def play_deck
    loop do
      if no_more_cards?
        display_out_of_cards_notice
        break
      end
      deal_initial_cards
      display_dealer_initial_hand
      show_hand @player
      players_turn
      dealers_turn unless player_busted?
      display_winner
      display_hands
      continue_playing?
      reset
    end
  end

  def reset
    clear_hands
    redraw_screen
  end

  def display_out_of_cards_notice
    puts "Deck has been exausted!"
  end

  def continue_playing?
    unless play_again?
      display_goodbye
      exit
    end
  end

  def display_hands
    horizontal_line
    show_hand @dealer
    show_hand @player
    puts ''
    puts ''
  end

  def meet_players
    @player.set_name
    @dealer.set_name
  end

  def clear_hands
    @dealer.clear
    @player.clear
  end

  def player_busted?
    @player.busted?
  end

  def dealer_busted?
    @dealer.busted?
  end

  def redraw_screen
    system_clear
  end

  def display_dealer_initial_hand
    puts ''
    puts "#{@dealer}' Card"
    show_last_card @dealer
    puts ''
  end

  def timer(message, seconds)
    print message
    seconds.times do
      sleep(DOT_SPEED)
      print ' '
      print '.'
    end
    puts ''
    puts ''
  end

  def system_clear
    system('clear') || system('cls')
  end

  def horizontal_line
    puts '-------------------------------'
  end

  def display_winner
    horizontal_line
    puts 'Hand is over.'
    winner = determine_winner
    if winner.nil?
      puts 'It is a tie!'
    else
      puts "#{winner} won!"
    end
    puts ''
  end

  def determine_winner
    return @dealer if player_busted?
    return @player if dealer_busted?
    return nil if dealer_hand_score == player_hand_score
    dealer_hand_score > player_hand_score ? @dealer : @player
  end

  def dealers_turn
    display_turn @dealer
    show_hand @dealer
    sleep(DEALER_HAND_DRAW_SLEEP)
    turn_of @dealer
    sleep(END_OF_TURN_SLEEP)
    redraw_screen
  end

  def turn_of(player)
    loop do
      break if busted?(player) || stay?(player)
      timer('Drawing a Card', 3)
      get_card player
      show_last_card player
      display_score player
    end
    puts busted?(player) ? 'Busted!!' : "#{player} Stays."
    puts ''
  end

  def get_card(player)
    player.hand = @dealer.deal
  end

  def players_turn
    turn_of @player
    sleep(END_OF_TURN_SLEEP) if busted? @player
    redraw_screen
  end

  def busted?(player)
    player.busted?
  end

  def stay?(player)
    player.stay?
  end

  def display_score(player)
    puts "#{player}'s current total:"
    puts hand_score player
  end

  def dealer_hand_score
    hand_score @dealer
  end

  def hand_score(player)
    player.total
  end

  def player_hand_score
    hand_score @player
  end

  def display_turn(name)
    horizontal_line
    puts "#{name}'s turn:"
  end

  def show_last_card(player)
    puts player.show_last_card
  end

  def show_hand(player)
    puts ''
    puts "#{player}'s Cards:"
    player.show_hand
    puts "#{player} total:#{player.total}"
  end

  def deal_initial_cards
    2.times do
      get_card @dealer
      get_card @player
    end
  end

  def shuffle_cards
    @dealer.shuffle
  end

  def no_more_cards?
    @dealer.no_more_cards?
  end

  def display_welcome
    puts ''
    puts 'Welcome To Game of 21 :)'
    puts ''
  end

  def display_greetings
    puts ''
    puts "Hi #{@player}!"
    puts 'You will be playing with one deck of cards.'
    puts 'Once we have 8 cards or less left game will be over.'
    puts ''
  end

  def display_goodbye
    puts ''
    puts 'Thank you for playing'
    puts ''
  end
end

TwentyOne.new.play
