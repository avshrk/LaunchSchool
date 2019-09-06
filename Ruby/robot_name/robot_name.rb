
# frozen_string_literal: true
#
require 'byebug'

class Robot
  attr_reader :name
  @@used_names = []

  def initialize
    generate_name
  end

  def reset
    generate_name
  end

  def generate_name
    loop do
      @name = two_letters + three_numbers
      break @name if unique?
    end
    record_name
    @name
  end

  private

  def record_name
    @@used_names << self.name
  end

  def unique?
    !@@used_names.include? self.name
  end

  def two_letters
    rand_letter + rand_letter
  end

  def three_numbers
    rand_number + rand_number + rand_number
  end

  def rand_letter
    rand(65..90).chr
  end

  def rand_number
    rand(1..9).to_s
  end
end
