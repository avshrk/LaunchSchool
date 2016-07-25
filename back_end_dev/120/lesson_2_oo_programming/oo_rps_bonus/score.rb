# frozen_string_literal: true

module Score
  GAME_SCORE = 10

  def score
    @score ||= {}
  end

  def score_of(player)
    @score[player] ||= 0
  end

  def increase_score(player)
    @score[player] ||= 0
    @score[player] += 1
  end

  def reset_player_scores
    score
    @score.keys.each do |player|
      @score[player] = 0
    end
  end

  def max_score
    @score.values.max || 0
  end

  def winning_player
    @score.key(max_score).to_s
  end
end
