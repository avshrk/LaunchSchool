require_relative 'player'

class Human < Player
  def initialize
    super
  end

  def play(board)
    nth_square = ''
    loop do
      puts "Please choose: (#{board.empty_squares.join(', ')})"
      nth_square = gets.chomp.to_i
      break if board.empty_squares.include? nth_square
      puts "Invalid Choice."
    end
    board[nth_square] = @marker
  end

  def set_name
    name = ''
    loop do
      puts 'Please type your name:'
      name = gets.chomp
      break unless name.empty?
      puts 'Name can not be blank.'
    end
    @name = name
  end
end
