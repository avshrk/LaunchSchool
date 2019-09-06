class Score
  GAME_POINT = 5

  def initialize(player_one, player_two)
    @score = {}
    @score[player_one] = 0
    @score[player_two] = 0
  end

  def increase(player)
    @score[player] += 1
  end

  def reset
    @score.each { |key, _| @score[key] = 0 }
  end

  def max
    @score.values.max
  end

  def display
    player_one, player_other = @score.keys
    puts "Score Board"
    puts "#{player_one}:#{@score[player_one]} vs #{player_other}:#{@score[player_other]}"
    puts ''
  end
end
