# frozen_string_literal: true
require_relative 'player'
require_relative 'move'

class Human < Player
  def choose
    choice = ''
    loop do
      display_choices
      choice = gets.chomp.strip.downcase
      break if valid_input? choice
      puts "Invalid input!"
    end
    @move = Move.new choice
  end

  def request_name
    human_name = ''
    loop do
      puts "Please enter your name"
      human_name = gets.chomp
      break unless n.empty?
      puts "Name can not be blank."
    end
    @name = human_name
  end

  private

  def valid_input?(choice)
    Move::VALUES.keys.include? choice
  end

  def display_choices
    puts "Please choose: \n- #{Move::VALUES.keys.join(" \n- ")}"
  end
end
