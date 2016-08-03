require 'byebug'
require_relative 'square'
require_relative 'board'
require_relative 'computer'
require_relative 'human'
require_relative 'score'

class TTTGame
  MARKERS = ['X', 'O'].freeze

  def initialize
    @board = Board.new
    @human = Human.new
    @computer = Computer.new
    clear_screen
    display_welcome
    set_names
    set_markers
    @score = Score.new(@human.name, @computer.name)
  end

  def play
    loop do
      play_game_set
      break unless play_again?
      clear_screen
      display_play_again_message
      clear_board
      clear_score
    end
    display_goodbye
  end

  private

  def play_game_set
    loop do
      set_current_player
      clear_screen
      play_hand
      display_board
      update_score_board
      display_result
      display_game_score
      break if max_score == Score::GAME_POINT
      restarting
      clear_screen
      clear_board
    end
  end

  def play_hand
    loop do
      display_board
      current_player_moves
      clear_screen
      break if game_over?
    end
  end

  def clear_score
    @score.reset
  end

  def restarting
    print 'Starting a new game.'
    4.times do
      sleep(1)
      print '.'
    end
  end

  def display_game_score
    @score.display
  end

  def max_score
    @score.max
  end

  def update_score_board
    return nil if @board.winning_marker.nil?
    @board.winning_marker == @human.marker ? @score.increase(@human.name) : @score.increase(@computer.name)
  end

  def set_names
    @human.set_name
    @computer.set_name
  end

  def set_markers
    set_human_marker
    set_computer_marker
  end

  def set_human_marker
    marker = ''
    loop do
      puts "Please choose your marker: #{MARKERS.join(', ')}"
      marker = gets.chomp.upcase
      break if MARKERS.include? marker
      puts 'Invalid choice.'
    end
    @human.marker = marker
  end

  def set_computer_marker
    @computer.marker = MARKERS.select { |mark| mark != @human.marker }[0]
  end

  def first_player
    answer = ''
    loop do
      puts 'Would you like to go first? (y/n)'
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts 'Invalid answer.'
    end
    answer == 'y' ? @human : @computer
  end

  def display_welcome
    puts ''
    puts 'Welcome to Tic Tac Toe'
  end

  def display_goodbye
    puts 'Thank you for playing. Goodbye!'
    puts ''
  end

  def human_moves
    @human.play @board
  end

  def computer_moves
    @computer.play @board
  end

  def display_result
    case @board.winning_marker
    when @human.marker
      puts "#{@human.name} Won"
    when @computer.marker
      puts "#{@computer.name} Won"
    else
      puts 'It is a tie'
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
    @board.reset
  end

  def game_over?
    @board.game_over?
  end

  def display_play_again_message
    puts "Let's play again"
    puts ''
  end

  def set_current_player
    @current_player_marker = first_player.marker
  end

  def current_player_human?
    @human.marker == @current_player_marker
  end

  def alternate_current_player
    @current_player_marker = current_player_human? ? @computer.marker : @humane.marker
    # if current_player_human?
    #   @current_player_marker = @computer.marker
    # else
    #   @current_player_marker = @human.marker
    # end
  end

  def current_player_moves
    current_player_human? ? human_moves : computer_moves
    alternate_current_player
  end

  def clear_screen
    system 'clear'
  end

  def display_board
    puts "#{@human.name}:#{@human.marker} vs #{@computer.name}:#{@computer.marker}"
    puts ""
    @board.draw
    puts ""
  end
end

TTTGame.new.play
