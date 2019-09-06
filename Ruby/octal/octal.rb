require 'byebug'

class Octal
  OCTAL_BASE = 8

  def initialize(octal_number)
    @octal = octal_number
  end

  def to_decimal
    return 0 unless valid_octal?
    convert
  end

  private

  def convert
    integer_list.reverse.each_with_index.map do |num, idx|
       num * (OCTAL_BASE ** idx)
    end.reduce(:+)
  end

  def integer_list
    @octal.chars.map(&:to_i)
  end

  def valid_octal?
    @octal.chars.all? { |char| ('0'..'7').include? char }
  end
end
