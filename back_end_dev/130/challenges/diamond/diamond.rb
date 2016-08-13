class Diamond
  FIRST_LETTER = 'A'.freeze
  SPACE = ' '.freeze
  EMPTY = ''.freeze

  def self.make_diamond(letter)
    @letters = (FIRST_LETTER..letter.upcase).to_a
    (top_half + bottom_half(top_half.dup)).join
  end

  def self.top_half
    top = []
    @letters.each_with_index do |each_letter, indx|
      outter_space = SPACE * (@letters.size - indx - 1)
      inner_space = indx.positive? ? SPACE * ((2 * indx) - 1) : nil
      top << outter_space + each_letter +
                  (inner_space ? inner_space + each_letter : EMPTY) +
                  outter_space + "\n"
    end
    top
  end

  def self.bottom_half(top_half)
    top_half.pop
    top_half.reverse
  end
end

module Bookkeeping
  VERSION = 1
end
