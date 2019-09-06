# frozen_string_literal: true
require_relative 'deck'
require_relative 'participant'
require 'byebug'

class Dealer < Participant
  STOP_POINT = 17

  def initialize
    @deck = Deck.new
    super
  end

  def hit?
    total < STOP_POINT
  end

  def set_name
    @name = 'Dealer Joe'
  end

  def shuffle
    @deck.shuffle
  end

  def deal
    @deck.take_card
  end

  def no_more_cards?
    @deck.no_more_cards?
  end
end
