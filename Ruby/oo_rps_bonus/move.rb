# frozen_string_literal: true
class Move
  include Comparable
  VALUES = {
    'rock' => ['scissors', 'lizard'],
    'scissors' => ['paper', 'lizard'],
    'paper' => ['rock', 'spock'],
    'lizard' => ['spock', 'paper'],
    'spock' => ['scissors', 'rock']
  }.freeze

  def initialize(move)
    @value = move
  end

  def self.winner(player_one, player_other)
    return player_one.name if player_one.move > player_other.move
    return player_other.name if player_other.move > player_one.move
    return '' # it is a tie
  end

  def <=>(other)
    return -1 if VALUES[other.to_s].include? @value
    return 0 if @value == other.to_s
    return 1 if VALUES[@value].include? other.to_s
  end

  def to_s
    @value
  end
end
