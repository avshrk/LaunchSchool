require 'pry'
require 'byebug'

PLY_MRK = 'x'.freeze
CMT_MRK = 'o'.freeze
INI_MRK = ' '.freeze
CENTER_SQR = 5
ROW_COUNT = 3
GAME_POINT = 5
CHOOSE = true
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
  4.times do
    print '.'
    sleep(1)
  end
end

def continue_playing
  prompt 'Do you want to play again ? (y/n)'
  answer = gets.chomp.downcase
  answer.start_with?('y')
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

def computer_move(brd, mark)
  WINNING_LINES.each do |line|
    empty_square_count = brd.values_at(*line).count(INI_MRK)
    mark_count = brd.values_at(*line).count(mark)
    next if empty_square_count != 1 || mark_count != 2
    return line.select { |sqr| brd[sqr] == INI_MRK }[0]
  end
  nil
end

def defense(brd)
  computer_move(brd, PLY_MRK)
end

def offense(brd)
  computer_move(brd, CMT_MRK)
end

def center(brd)
  return CENTER_SQR if brd[CENTER_SQR] == INI_MRK
  nil
end

def computer_places_piece!(brd)
  square = offense(brd) || defense(brd) || center(brd) || empty_squares(brd).sample
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

def place_piece(brd, cur_player)
  cur_player == PLAYERS[PLY_MRK] ? player_places_piece!(brd) : computer_places_piece!(brd)
end

def play_session(w_count, brd, current_player)
  loop do
    place_piece(brd, current_player)
    current_player = alternate_current_player(current_player)
    display_board(brd)
    break if someone_won?(brd) || board_full?(brd)
  end
  increase_winner_score(w_count, brd) if someone_won?(brd)
  display_result(brd)
  display_current_score(w_count)
end

def who_plays_first
  prompt "Would you like to go first ? (y for yes, any key for no)?"
  return PLAYERS[PLY_MRK] if gets.chomp.downcase.start_with?('y')
  PLAYERS[CMT_MRK]
end

def alternate_current_player(player)
  PLAYERS[PLY_MRK] == player ? PLAYERS[CMT_MRK] : PLAYERS[PLY_MRK]
end

def play_game
  win_count = { CMT_MRK => 0, PLY_MRK => 0 }
  current_player = PLAYERS[PLY_MRK]

  if CHOOSE
    current_player = who_plays_first
  end
  loop do
    board = initialize_board
    display_board(board)
    display_current_score(win_count)
    play_session(win_count, board, current_player)
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
