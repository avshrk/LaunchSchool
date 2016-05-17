require 'pry'

PLY_MRK = 'x'.freeze
CMT_MRK = 'o'.freeze
INI_MRK = ' '.freeze
ROW_COUNT = 3

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]
def prompt(str)
  puts "=> " + str
end

def display_board(brd)
  system 'clear'
  puts "You => #{PLY_MRK}. Computuer => #{CMT_MRK}"
  puts ""
  puts " #{brd[1]} | #{brd[2]} | #{brd[3]}"
  puts " #{brd[4]} | #{brd[5]} | #{brd[6]}"
  puts " #{brd[7]} | #{brd[8]} | #{brd[9]}"
  puts ""
end

def empty_squares(brd)
  brd.keys.select { |n| brd[n] == INI_MRK }
end

def initialize_board
  new_board = {}
  (1..9).each { |n| new_board[n] = INI_MRK }
  new_board
end

def player_places_piece!(brd)
  square = 0
  loop do
    prompt "Choose a square #{empty_squares(brd).join(', ')}: "
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt 'It is not a valid choice!'
  end
  brd[square] = PLY_MRK
end

def computer_places_piece!(brd)
  square = empty_squares(brd).sample
  brd[square] = CMT_MRK
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    next if brd.values_at(*line).count(INI_MRK) > 0
    return 'Player' if brd.values_at(*line).count(PLY_MRK) == ROW_COUNT
    return 'Computer' if brd.values_at(*line).count(CMT_MRK) == ROW_COUNT
  end
  nil
end

loop do
  board = initialize_board
  display_board(board)

  loop do
    player_places_piece!(board)
    display_board(board)
    break if someone_won?(board) || board_full?(board)
    computer_places_piece!(board)
    display_board(board)
    break if someone_won?(board) || board_full?(board)
  end

  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
  else
    prompt "It is a tie."
  end
  prompt 'Do you want to play again ? (y/n)'
  answer = gets.chomp.downcase
  break unless answer.start_with?('y')
end
