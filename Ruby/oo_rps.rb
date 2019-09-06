# frozen_string_literal: true
class Move
  VALUES = {
    'rock' => 'scissors',
    'scissors' => 'paper',
    'paper' => 'rock'
  }.freeze
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def >(other)
    VALUES[@value] == other.value
  end

  def <(other)
    VALUES[other.value] == @value
  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :name, :move
  def initialize
    set_name
  end

  def display_choice
    puts "#{@name} chose #{@move}"
  end
end

class Human < Player
  def set_name
    self.name = request_name
  end

  def choose
    choice = ''
    loop do
      puts "Please choose: #{Move::VALUES.keys.join(' , ')}   "
      choice = gets.chomp.strip.downcase
      break if Move::VALUES.keys.include? choice
      puts "Invalid input!"
    end
    self.move = Move.new(choice)
  end

  private

  def request_name
    nm = ''
    loop do
      puts "Please enter your name"
      nm = gets.chomp
      break unless nm.empty?
      puts "Name can not be blank. Please enter your name!"
    end
    nm
  end
end

class Computer < Player
  def set_name
    self.name = ['b2', 'q3', 'a8'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.keys.sample)
  end
end

class RSPGame
  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "#{@human.name}, lets play Rock-Paper-Scissors"
  end

  def display_goodbye_message
    puts "Thank you for playing. Goodbye!"
  end

  def display_winner
    if @computer.move > @human.move
      puts "#{@computer.name} won!"
    elsif @computer.move < @human.move
      puts "#{@human.name} won!"
    else
      puts "It is a tie!"
    end
  end

  def play
    display_welcome_message
    loop do
      @human.choose
      @human.display_choice
      @computer.choose
      @computer.display_choice
      display_winner
      break unless play_again?
    end
    display_goodbye_message
  end

  def play_again?
    answer = ''
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase.strip
      break if ['y', 'n'].include? answer
      puts "Invalid answer!"
    end
    answer == 'y' ? true : false
  end
end

RSPGame.new.play
