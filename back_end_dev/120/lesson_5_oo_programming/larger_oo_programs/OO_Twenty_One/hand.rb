# frozen_string_literal: true
module Hand
  TWENTY_ONE = 21
  ACE_HIGH_VALUE = 10

  def total
    total = 0
    @hand.each { |each_card| total += each_card.value }
    return total if total > TWENTY_ONE || no_ace?
    return total += ACE_HIGH_VALUE if total + ACE_HIGH_VALUE <= TWENTY_ONE
    total
  end

  def no_ace?
    !any_ace?
  end

  def clear
    @hand = []
  end

  def stay?
    !hit?
  end

  def show_last_card
    @hand.last
  end

  def hand=(card)
    @hand << card
  end

  def show_hand
    @hand.each { |each_card| puts each_card }
  end

  def any_ace?
    @hand.any?(&:ace?)
  end

  def busted?
    total > TWENTY_ONE
  end
end
