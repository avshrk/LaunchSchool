# frozen_string_literal: true
require_relative 'score'
require_relative 'move'
require_relative 'human'
require_relative 'computer'
require_relative 'history'

require 'byebug'

class RSPGame
  include Score

  def initialize
    @human = Human.new
    @computer = Computer.new
    @history = History.new
  end

  def display_welcome_message
    puts "Rock-Paper-Scissors Bonus"
  end

  def display_goodbye_message
    puts "Thank you for playing. Goodbye!"
  end

  def display_hand_winner
    hand_winner = Move.winner(@computer, @human)
    if hand_winner.empty?
      puts "It is a tie"
    else
      increase_score(hand_winner)
      puts "#{hand_winner} won!"
    end
  end

  def display_game_winner
    puts "Game Set Winner is #{winning_player}"
  end

  def display_running_count
    puts "Score: #{@human.name}:#{score_of(@human.name)} VS #{@computer.name}:#{score_of(@computer.name)}"
  end

  def display_moves
    puts "#{@human.name} choose #{@human.move}"
    puts "#{@computer.name} choose #{@computer.move}"
  end

  def make_moves
    @computer.choose(@history)
    @human.choose
  end

  def record_moves
    @history.add(@computer, @human)
  end

  def play_game_set
    reset_player_scores
    loop do
      break if max_score == Score::GAME_SCORE
      make_moves
      record_moves
      display_moves
      display_hand_winner
      display_running_count
    end
  end

  def play_again?
    answer = ''
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase.strip
      break if ['y', 'n'].include? answer
      puts "Invalid answer!"
    end
    answer == 'y'
  end

  def request_human_name
    @human.request_name
  end

  def record_new_game
    @history.record_new_game
  end

  def display_game_history
    @history.display
  end

  def play
    display_welcome_message
    request_human_name
    loop do
      record_new_game
      play_game_set
      display_game_winner
      break unless play_again?
    end
    display_game_history
    display_goodbye_message
  end
end

RSPGame.new.play
