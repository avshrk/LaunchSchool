require 'pry'
require 'byebug'

PLAYER_MARK = 'x'.freeze
COMPUTER_MARK = 'o'.freeze
INITIAL_MARK = ' '.freeze
CENTER_SQUARE = 5
ROW_COUNT = 3
GAME_POINT = 5
CHOOSE = true
PLAYERS = { PLAYER_MARK => 'You', COMPUTER_MARK => 'Computer' }.freeze
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]].freeze

def prompt(str)
  puts "=> " + str
end

def system_clear
  system('clear') || system('cls')
end

def display_board(board)
  system_clear
  puts "You => #{PLAYER_MARK}. Computuer => #{COMPUTER_MARK}"
  puts ""
  puts " #{board[1]} | #{board[2]} | #{board[3]}"
  puts "-----------"
  puts " #{board[4]} | #{board[5]} | #{board[6]}"
  puts "-----------"
  puts " #{board[7]} | #{board[8]} | #{board[9]}"
  puts ""
end

def start_over
  print 'Starting over'
  4.times do
    print '.'
    sleep(1)
  end
end

def valid_answer?(choices, given)
  choices.include?given
end

def display_choices(choices)
  prompt "Please type : #{joinor(choices)} "
end

def continue_playing?
  answer = nil
  choices = ['yes', 'no']
  loop do
    prompt 'Do you want to play again ? (yes/no)'
    answer = gets.chomp.downcase
    break if valid_answer?(choices, answer)
    prompt 'It is not a valid choice!'
    display_choices(choices)
  end
  answer == 'yes'
end

def empty_squares(board)
  board.keys.select { |square| board[square] == INITIAL_MARK }
end

def board_full?(board)
  empty_squares(board).empty?
end

def line_mark_count(board, line, given_mark)
  board.values_at(*line).count(given_mark)
end

def detect_winner(board)
  WINNING_LINES.each do |line|
    next if line_mark_count(board, line, INITIAL_MARK) > 0
    if line_mark_count(board, line, PLAYER_MARK) == ROW_COUNT
      return PLAYER_MARK
    elsif line_mark_count(board, line, COMPUTER_MARK) == ROW_COUNT
      return COMPUTER_MARK
    end
  end
  nil
end

def someone_won?(board)
  !!detect_winner(board)
end

def display_result(board)
  if someone_won?(board)
    prompt "#{PLAYERS[detect_winner(board)]} won!"
  else
    prompt "It is a tie."
  end
end

def initialize_board
  new_board = {}
  (1..9).each { |square| new_board[square] = INITIAL_MARK }
  new_board
end

def valid_move?(board, square)
  !!empty_squares(board).include?(square)
end

def joinor(list, delimiter = ',', conjunction = 'or')
  join_list = list.clone
  join_list[-1] = " #{conjunction} " + join_list.last.to_s if join_list.size > 1
  join_list.join(delimiter)
end

def player_places_piece!(board)
  square = 0
  loop do
    prompt "Choose a square : "
    display_choices(empty_squares(board))
    square = gets.chomp.to_i
    break if valid_move?(board, square)
    prompt 'It is not a valid choice!'
  end
  board[square] = PLAYER_MARK
end

def computer_move(board, mark)
  WINNING_LINES.each do |line|
    empty_square_count = line_mark_count(board, line, INITIAL_MARK)
    mark_count = line_mark_count(board, line, mark)
    next if empty_square_count != 1 || mark_count != 2
    return line.select { |sqr| board[sqr] == INITIAL_MARK }[0]
  end
  nil
end

def defense(board)
  computer_move(board, PLAYER_MARK)
end

def offense(board)
  computer_move(board, COMPUTER_MARK)
end

def center(board)
  return CENTER_SQUARE if board[CENTER_SQUARE] == INITIAL_MARK
  nil
end

def computer_places_piece!(board)
  square = offense(board) \
           || defense(board) \
           || center(board) \
           || empty_squares(board).sample
  board[square] = COMPUTER_MARK
end

def display_current_score(count)
  player = PLAYERS[PLAYER_MARK]
  computer = PLAYERS[COMPUTER_MARK]
  puts ""
  prompt "Current Game Score: "
  prompt "#{player}:#{count[PLAYER_MARK]} & #{computer}:#{count[COMPUTER_MARK]}"
  puts ""
end

def game_over(game_score)
  prompt "\n**********Game Over!***************"
  prompt "#{PLAYERS[game_score.key(GAME_POINT)]} won the Game!"
end

def game_point_reached?(score_count)
  score_count.value?(GAME_POINT)
end

def increase_winner_score(score_count, board)
  score_count[detect_winner(board)] += 1
end

def place_piece(board, cur_player)
  player_mark = PLAYERS[PLAYER_MARK]
  if cur_player == player_mark
    player_places_piece!(board)
  else
    computer_places_piece!(board)
  end
end

def play_session(score_count, board, current_player)
  loop do
    place_piece(board, current_player)
    current_player = alternate_current_player(current_player)
    display_board(board)
    break if someone_won?(board) || board_full?(board)
  end
  increase_winner_score(score_count, board) if someone_won?(board)
  display_result(board)
  display_current_score(score_count)
end

def who_plays_first
  answer = nil
  loop do
    prompt "Would you like to go first (yes,no) ?"
    answer = gets.chomp.downcase
    break if valid_answer?(['yes', 'no'], answer)
    system_clear
    prompt 'It is not a valid choice!'
    display_choices(['yes', 'no'])
  end
  return PLAYERS[PLAYER_MARK] if answer == 'yes'
  PLAYERS[COMPUTER_MARK]
end

def alternate_current_player(player)
  PLAYERS[PLAYER_MARK] == player ? PLAYERS[COMPUTER_MARK] : PLAYERS[PLAYER_MARK]
end

def play_game
  game_score = { COMPUTER_MARK => 0, PLAYER_MARK => 0 }
  current_player = PLAYERS[PLAYER_MARK]
  if CHOOSE
    current_player = who_plays_first
  end
  loop do
    board = initialize_board
    display_board(board)
    display_current_score(game_score)
    play_session(game_score, board, current_player)
    break if game_point_reached?(game_score)
    start_over
  end
  game_over(game_score)
end

def tic_tac_toe
  system_clear
  prompt 'Tic Tac Toe Game'
  loop do
    play_game
    break unless continue_playing?
  end
  prompt 'Goodbye!'
end

tic_tac_toe
