# frozen_string_literal: true
require_relative 'hand'
require_relative 'participant'

class Player < Participant
  def initialize
    super
  end

  def hit?
    answer = ''
    loop do
      puts ''
      puts "Would you like to hit? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts 'Invalid Input'
    end
    answer == 'y'
  end

  def set_name
    name = ''
    loop do
      puts 'Please enter your name'
      name = gets.chomp.capitalize
      break if ('A'..'Z').to_a.include? name[0]
      puts 'Invalid Input'
    end
    @name = name
  end
end
