require 'byebug'

class SecretHandshake
  REVERSE = 4
  MAX_INPUT = 31

  def initialize(input)
    @code = ['wink', 'double blink', 'close your eyes', 'jump']
    @input = input
  end

  def commands
    return [] unless valid_input?
    decode
  end

  private

  def decode
    decoded = []
    handshake = convert_to_binary_array
    handshake.reverse.each_with_index do |value, idx|
      break if idx == 4
      decoded << @code[idx] if value.to_i == 1
    end
    if handshake.size > 4 && handshake[REVERSE].to_i == 1
      decoded.reverse!
    else
      decoded
    end
  end

  def valid_input?
    if @input.is_a? String
      @input.to_i.to_s == @input
    else
      @input <= MAX_INPUT
    end
  end

  def convert_to_binary_array
    if @input.is_a? String
      @input.to_i.to_s(2).split('')
    else
      @input.to_s(2).split('')
    end
  end
end
