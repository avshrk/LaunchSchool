# frozen_string_literal: true
require_relative 'hand'

class Participant
  attr_reader :hand
  include Hand

  def initialize
    @hand = []
    @name = ''
  end

  def to_s
    @name
  end
end
