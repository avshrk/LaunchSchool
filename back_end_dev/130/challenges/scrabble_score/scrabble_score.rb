
class Scrabble
  SCORES = { a: 1, e: 1, i: 1, o: 1, u: 1, l: 1, n: 1, r: 1, s: 1,
             t: 1, d: 2, g: 2, b: 3, c: 3, m: 3, p: 3, f: 4, h: 4,
             v: 4, w: 4, y: 4, k: 5, j: 8, x: 8, q: 10, z: 10 }.freeze

  def initialize(word)
    @word = down_case(word)
  end

  def score
    return 0 if invalid_word
    total_score
  end

  def total_score
    @word.split('').reduce(0) do |accum, value|
      accum + SCORES[value.to_sym]
    end
  end

  def self.score(word)
    Scrabble.new(word).score
  end

  def down_case(word)
    word.respond_to?(:downcase) ? word.strip.downcase : '_'
  end

  def invalid_word
    !valid_word
  end

  def valid_word
    @word.split('').all? { |char| SCORES.keys.include? char.to_sym }
  end
end
