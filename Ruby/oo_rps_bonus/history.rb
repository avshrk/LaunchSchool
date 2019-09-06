# frozen_string_literal: true
require_relative 'move'

class History
  attr_reader :list
  def initialize
    @list = []
    @game_start_points = []
  end

  def record_new_game
    @game_start_points << @list.size
  end

  def add(p1, p2)
    @list << { p1.name => p1.move.to_s, p2.name => p2.move.to_s, winner: Move.winner(p1, p2) }
  end

  def by_player_with_results(name)
    player_history = []
    @list.each do |hand|
      player_history << [hand[name], hand[:winner] == name]
    end
    player_history
  end

  def summary_by_player_by_move(name)
    summary = {}
    player_history = by_player_with_results(name)
    Move::VALUES.keys.each do |mv|
      summary[mv] = {}
      summary[mv] = { 'play_count' => player_history.flatten.count(mv),
                      'win_count' => win_count_by(player_history, mv) }
    end
    summary
  end

  def win_count_by(hist, move)
    count = 0
    hist.each do |hand|
      count += 1 if hand[0] == move && hand[1]
    end
    count
  end

  def display
    game_number = 0
    @list.each_with_index do |hand, index|
      if @game_start_points.include? index
        puts '---------------------------'
        puts "Game Number: #{game_number += 1}"
        puts '  ' + first_player_name(hand).ljust(10) + 'VS ' + second_player_name(hand).ljust(10) + " | #{'Winner'.ljust(10)} "
      end
      puts "#{(index + 1)}. " + first_player_move(hand).ljust(10) + '| ' + second_player_move(hand).ljust(10) + " | #{winner(hand).ljust(10)} "
    end
  end

  def size
    @list.size
  end

  def to_s
    @list
  end

  private

  def winner(hand)
    hand[:winner] == '' ? 'Tie' : hand[:winner]
  end

  def first_player_name(hand)
    hand.keys[0]
  end

  def second_player_name(hand)
    hand.keys[1]
  end

  def first_player_move(hand)
    hand.values[0]
  end

  def second_player_move(hand)
    hand.values[1]
  end
end
