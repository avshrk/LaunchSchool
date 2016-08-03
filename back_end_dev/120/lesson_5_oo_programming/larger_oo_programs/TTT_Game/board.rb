require_relative 'square'
require_relative 'board'
require_relative 'player'

class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
                   [1, 4, 7], [2, 5, 8], [3, 6, 9],
                   [1, 5, 9], [3, 5, 7]].freeze
  CENTER = 5

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

  def clear(key)
    @squares[key].marker = Square::INITIAL_MARKER
  end

  def game_over?
    someone_won? || full?
  end

  def all_the_same_mark?(line)
    line.uniq { |number| @squares[number].marker }.count == 1
  end

  def count(mark, line)
    line.select { |number| @squares[number].marker == mark }.count
  end

  def empty_squares_count(line)
    line.reject do |number|
      @squares[number].marked?
    end.count
  end

  def all_marked?(line)
    line.all? { |number| @squares[number].marked? }
  end

  def first_mark(line)
    @squares[line.first].marker
  end

  def []=(key, marker)
    @squares[key].marker = marker
  end

  def [](key)
    @squares[key]
  end

  def empty_squares
    @squares.reject { |_, values| values.marked? }.keys
  end

  def center_empty?
    !@squares[CENTER].marked?
  end

  def full?
    @squares.values.all?(&:marked?)
  end

  def empty?
    @squares.values.none?(&:marked?)
  end

  def winning_marker
    WINNING_LINES.each do |line|
      next unless all_marked? line
      return first_mark line if all_the_same_mark? line
    end
    nil
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
