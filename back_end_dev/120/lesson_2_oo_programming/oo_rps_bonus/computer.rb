# frozen_string_literal: true
require_relative 'player'
require_relative 'move'

class Computer < Player
  def initialize
    @name = ['ROBOT01', 'ROBOT02', 'ROBOT03'].sample
  end

  def choose(hands)
    possible_opponent_move = opponent_next_move(hands)
    if possible_opponent_move.empty?
      @move =  Move.new(Move::VALUES.keys.shuffle.sample)
    else
      @move = winner_move(possible_opponent_move.sample, hands)
    end
  end

  private

  def winner_move(opponent_move, hands)
    winning_moves = Move::VALUES.select { |_, value| value.include? opponent_move }.keys
    most_winner(winning_moves, hands)
  end

  def most_winner(win_moves, hands)
    computer_summary = hands.summary_by_player_by_move(@name)

    if computer_summary[win_moves.first]['win_count'] == computer_summary[win_moves.last]['win_count']
      return win_moves.sample
    end

    if computer_summary[win_moves.first]['win_count'] > computer_summary[win_moves.last]['win_count']
      return win_moves.first
    else
      return win_moves.last
    end
  end

  def opponent_next_move(hand_history)
    total_hand_count = hand_history.size
    return '' if total_hand_count == 0
    opponent_name = other_player_name(hand_history)
    opponent_summary = hand_history.summary_by_player_by_move(opponent_name)
    ratios = move_ratio(opponent_summary, total_hand_count)
    return '' if ratios.values.max == 0
    moves_with_max(ratios)
  end

  def move_ratio(opponent_summary, total_hand_count)
    ratios = {}
    opponent_summary.each do |key, value|
      ratios[key] = move_likelyhood(value, total_hand_count)
    end
    ratios
  end

  def moves_with_max(ratios)
    ratios.select { |_, value| value == ratios.values.max }.keys
  end

  def move_likelyhood(summary, total_hand_count)
    play_ratio(summary, total_hand_count) * win_ratio(summary)
  end

  def play_ratio(summary, total_hand_count)
    return 0 if play_count(summary) == 0
    (play_count(summary) / total_hand_count.to_f).round(4)
  end

  def win_ratio(summary)
    return 0 if win_count(summary) == 0
    (win_count(summary) / play_count(summary).to_f).round(4)
  end

  def play_count(summary)
    summary[summary.keys[0]]
  end

  def win_count(summary)
    summary[summary.keys[1]]
  end

  def other_player_name(hand)
    if first_player_name(hand) == @name
      return second_player_name(hand)
    else
      first_player_name(hand)
    end
  end

  def first_player_name(hand)
    hand.list[0].keys[0]
  end

  def second_player_name(hand)
    hand.list[0].keys[1]
  end
end
