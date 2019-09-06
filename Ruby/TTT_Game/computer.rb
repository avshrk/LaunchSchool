require_relative 'player'
require 'byebug'

class Computer < Player
  ROLES = { 1 => 'Random', 2 => 'Smart', 3 => 'Unbeatable' }.freeze

  def initialize
    super
  end

  def set_name
    @name = ROLES[human_pick_computer_role]
  end

  def play(board)
    case @name
    when ROLES[1]
      play_random(board)
    when ROLES[2]
      play_smart(board)
    else
      play_unbeatable(board)
    end
  end

  def play_random(board)
    board[board.empty_squares.sample] = @marker
  end

  def play_smart(board)
    return if play_offense board
    return if play_defense board
    if board.center_empty?
      play_center board
      return
    end
    play_random(board)
  end

  def play_offense(board)
    mark_only_empty_square(board, 2)
  end

  def play_defense(board)
    mark_only_empty_square(board, 0)
  end

  def mark_only_empty_square(board, computer_mark_count)
    Board::WINNING_LINES.each do |line|
      next unless board.empty_squares_count(line) == 1
      next unless board.count(@marker, line) == computer_mark_count
      line.each do |number|
        board[number] = @marker unless board[number].marked?
      end
      return true
    end
    false
  end

  def play_center(board)
    board[Board::CENTER] = @marker
  end

  def play_unbeatable(board)
    if board.empty?
      play_center(board)
    else
      minmax(board.dup, @marker)
      board[@best_choice] = @marker
    end
  end

  # Resources & Credits
  # http://malcolmnewsome.com/post/74172036027/unbeatable-tic-tac-toe-with-minimax
  # https://github.com/markphelps/tictac/blob/master/lib/tictac/players/min_max.rb
  def minmax(board, current_player_mark)
    return score(board) if board.game_over?

    scores = {}
    board.empty_squares.each do |square|
      board[square] = current_player_mark
      scores[square] = minmax(board, switch(current_player_mark))
      board.clear square
    end

    @best_choice, best_score = best_move(current_player_mark, scores)
    best_score
  end

  def best_move(current_mark, scores)
    if current_mark == @marker
      scores.max_by { |_, v| v }
    else
      scores.min_by { |_, v| v }
    end
  end

  def switch(marker)
    TTTGame::MARKERS.reject { |other_marker| other_marker == marker }.first
  end

  def score(board)
    return 100 if board.winning_marker == @marker
    return -100 if board.winning_marker == opponent_marker
    0
  end

  def opponent_marker
    switch(@marker)
  end

  def switch_player(marker)
    marker == @marker ? opponent_marker : @marker
  end

  def human_pick_computer_role
    answer = ''
    loop do
      puts "Please select who you want to play against:"
      ROLES.each do |key, value|
        puts "#{key}) #{value}"
      end
      answer = gets.chomp.to_i
      break if ROLES.keys.include? answer
      puts 'Incorrect option.'
    end
    answer
  end
end
