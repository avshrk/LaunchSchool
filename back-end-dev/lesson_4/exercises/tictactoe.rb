require 'pry'

PLY_MRK = 'x'.freeze
CMT_MRK = 'o'.freeze
INI_MRK = ' '.freeze
ROW_COUNT = 3
GAME_POINT = 2
PLAYERS = { PLY_MRK => 'You', CMT_MRK => 'Computer' }.freeze

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]].freeze

def prompt(str)
  puts "=> " + str
end

def system_clear
  system 'clear'
end

def display_board(brd)
  system_clear
  puts "You => #{PLY_MRK}. Computuer => #{CMT_MRK}"
  puts ""
  puts " #{brd[1]} | #{brd[2]} | #{brd[3]}"
  puts " #{brd[4]} | #{brd[5]} | #{brd[6]}"
  puts " #{brd[7]} | #{brd[8]} | #{brd[9]}"
  puts ""
end

def start_over
  print 'Starting over'
  print '.'
  sleep(1)
  print '.'
  sleep(1)
  print '.'
  sleep(1)
  puts ''
end

def continue_playing
  prompt 'Do you want to play again ? (y/n)'
  answer = gets.chomp.downcase
  true ? answer.start_with?('y') : false
end

def empty_squares(brd)
  brd.keys.select { |n| brd[n] == INI_MRK }
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    next if brd.values_at(*line).count(INI_MRK) > 0
    return PLY_MRK if brd.values_at(*line).count(PLY_MRK) == ROW_COUNT
    return CMT_MRK if brd.values_at(*line).count(CMT_MRK) == ROW_COUNT
  end
  nil
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def display_result(brd)
  if someone_won?(brd)
    prompt "#{PLAYERS[detect_winner(brd)]} won!"
  else
    prompt "It is a tie."
  end
end

def initialize_board
  new_board = {}
  (1..9).each { |n| new_board[n] = INI_MRK }
  new_board
end

def valid_move?(brd, sqr)
  !!empty_squares(brd).include?(sqr)
end

def joinor(ary, delimiter = ',', conjunction = 'or')
  ary[-1] = " #{conjunction} " + ary.last.to_s if ary.size > 1
  ary.join(delimiter)
end

def player_places_piece!(brd)
  square = 0
  loop do
    prompt "Choose a square #{joinor(empty_squares(brd))}: "
    square = gets.chomp.to_i
    break if valid_move?(brd, square)
    prompt 'It is not a valid choice!'
  end
  brd[square] = PLY_MRK
end

def computer_places_piece!(brd)
  square = empty_squares(brd).sample
  brd[square] = CMT_MRK
end

def display_current_score(count)
  puts ""
  prompt "Current Game Score: "
  prompt "#{PLAYERS[PLY_MRK]}:#{count[PLY_MRK]} & #{PLAYERS[CMT_MRK]}:#{count[CMT_MRK]} "
  puts ""
end

def game_over(w_count)
  prompt "\n**********Game Over!***************"
  prompt "#{PLAYERS[w_count.key(GAME_POINT)]} won the Game!"
end

def game_point_reached?(w_count)
  w_count.value?(GAME_POINT)
end

def increase_winner_score(w_count, brd)
  w_count[detect_winner(brd)] += 1
end

def play_session(w_count, brd)
  loop do
    player_places_piece!(brd)
    break if someone_won?(brd) || board_full?(brd)
    computer_places_piece!(brd)
    display_board(brd)
    display_current_score(w_count)
    break if someone_won?(brd) || board_full?(brd)
  end
  increase_winner_score(w_count, brd) if someone_won?(brd)
  display_result(brd)
end

def play_game
  win_count = { CMT_MRK => 0, PLY_MRK => 0 }
  loop do
    board = initialize_board
    display_board(board)
    display_current_score(win_count)
    play_session(win_count, board)
    break if game_point_reached?(win_count)
    start_over
  end
  game_over(win_count)
end

def tic_tac_toe
  prompt 'Tic Tac Toe Game'
  loop do
    play_game
    break unless continue_playing
  end
end

tic_tac_toe
