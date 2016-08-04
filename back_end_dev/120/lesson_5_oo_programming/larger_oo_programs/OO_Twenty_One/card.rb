# frozen_string_literal: true
class Card
  SUIT = %w(H D S C).freeze
  SUIT_NAMES = { 'H' => 'Hearts',
                 'D' => 'Diamonds',
                 'C' => 'Clubs',
                 'S' => 'Spades' }.freeze
  FACE_CARD_NAMES = { 'J' => 'Jack',
                      'Q' => 'Queen',
                      'K' => 'King',
                      'A' => 'Ace' }.freeze
  RANK = (('2'..'10').to_a + %w(J Q K A)).freeze
  ACE = 'A'
  ZERO = 0
  ACE_LOW_VALUE = 1
  FACE_CARD_VALUE = 10

  def initialize(suit, rank)
    @suit = suit
    @rank = rank
  end

  def ace?
    @rank == ACE
  end

  def face_card?
    !numeric_card?
  end

  def numeric_card?
    @rank.to_i > ZERO
  end

  def value
    return ACE_LOW_VALUE if ace?
    return FACE_CARD_VALUE if face_card?
    @rank.to_i
  end

  def rank
    return @rank if numeric_card?
    FACE_CARD_NAMES[@rank]
  end

  def suit
    SUIT_NAMES[@suit]
  end

  def to_s
    "#{rank} of #{suit}"
  end
end
