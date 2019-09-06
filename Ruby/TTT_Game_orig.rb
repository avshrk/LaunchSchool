require 'byebug'

class Square
  INITIAL_MARKER = ' '
  attr_accessor :marker

  def initialize(marker= INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end
end

class Player
  attr_reader :marker
  def initialize(marker)
    @marker = marker
  end
end

class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
                   [1, 4, 7], [2, 5, 8], [3, 6, 9],
                   [1, 5, 9], [3, 5, 7]].freeze
  def initialize
    @squares = {}
    reset
  end

  def reset
    (1..9).each { |num| @squares[num] = Square.new }
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      next if line.any? { |number| @squares[number].marker == Square::INITIAL_MARKER }
      return @squares[line.first].marker if line.uniq { |number| @squares[number].marker }.count == 1
    end
    nil
  end

  def mark_square_at(key, marker)
    @squares[key].marker = marker
  end

  def empty_squares
    @squares.select { |_, values| values.marker == Square::INITIAL_MARKER }.keys
  end

  def full?
    @squares.values.none? { |values| values.marker == Square::INITIAL_MARKER }
  end

  def draw
    puts "      |      |"
    puts "  #{@squares[1]}   |   #{@squares[2]}  |   #{@squares[3]}"
    puts "      |      |"
    puts "------+------+------"
    puts "      |      |"
    puts "  #{@squares[4]}   |   #{@squares[5]}  |   #{@squares[6]}"
    puts "      |      |"
    puts "------+------+------"
    puts "      |      |"
    puts "  #{@squares[7]}   |   #{@squares[8]}  |   #{@squares[9]}"
    puts "      |      |"
  end

end

class TTTGame
  COMPUTER_MARKER = 'O'
  HUMAN_MAKER = 'X'

  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MAKER)
    @computer = Player.new(COMPUTER_MARKER)
  end

  def display_greetings
    puts ''
    puts 'Welcome to Tic Tac Toe'
  end

  def display_goodbye
    puts 'Thank you for playing. Goodbye!'
    puts ''
  end

  def human_moves
    nth_square = ''
    loop do
      puts "Please choose: (#{board.empty_squares.join(', ')})"
      nth_square = gets.chomp.to_i
      break if board.empty_squares.include? nth_square
      puts "Invalid Choice."
    end
    board.mark_square_at(nth_square, human.marker)
  end

  def computer_moves
    board.mark_square_at(board.empty_squares.sample, computer.marker)
  end

  def display_result
    case board.winning_marker
    when COMPUTER_MARKER
      puts "Computer Won"
    when HUMAN_MAKER
      puts "Human Won"
    else
      puts "It is a tie."
    end
    puts ''
  end

  def play_again?
    answer = ''
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts "Invalid choice."
    end
    answer == 'y'
  end

  def clear_board
    board.reset
  end

  def someone_won?
    board.someone_won?
  end

  def board_full?
    board.full?
  end

  def display_play_again_message
    puts "Let's play again"
    puts ''
  end

  def reset
      clear_screen
      clear_board
  end

  def play
    loop do
      human_moves
      break if someone_won? || board_full?
      clear_screen_and_display_board
      computer_moves
      break if someone_won? || board_full?
      clear_screen_and_display_board
    end
  end

  def play_game
    clear_screen
    display_greetings
    loop do
      display_board
      play
      clear_screen_and_display_board
      display_result
      break unless play_again?
      reset
      display_play_again_message
    end
    display_goodbye
  end

  def clear_screen
    system 'clear'
  end

  def clear_screen_and_display_board
    clear_screen
    display_board
  end

  def display_board
    puts "You:#{human.marker} vs Computer:#{computer.marker}"
    puts ""
    @board.draw
    puts ""
  end
end

TTTGame.new.play_game
