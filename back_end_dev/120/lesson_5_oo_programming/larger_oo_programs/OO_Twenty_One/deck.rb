# frozen_string_literal: true
require_relative 'card'

class Deck
  LAST_CARDS = 8

  def initialize
    @deck = []
  end

  def shuffle
    Card::SUIT.product(Card::RANK).shuffle.each do |each_card|
      @deck << Card.new(*each_card)
    end
  end

  def take_card
    @deck.pop
  end

  def no_more_cards?
    @deck.size < LAST_CARDS
  end
end
