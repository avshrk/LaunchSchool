require 'byebug'

class PhoneNumber
  INVALID = '0000000000'.freeze
  TEN = 10
  ONE = '1'.freeze
  ELEVEN = 11

  def initialize(phone_number)
    @phone_number = phone_number
    clean if valid_digits?
    remove_one if @phone_number.size == ELEVEN && valid_first_digit?
  end

  def area_code
    @phone_number[0..2]
  end

  def central_office
    @phone_number[3..5]
  end

  def line_number
    @phone_number[6..-1]
  end

  def number
    return INVALID unless valid?
    @phone_number
  end

  def to_s
    "(#{area_code}) #{central_office}-#{line_number}"
  end

  private

  def clean
    @phone_number = @phone_number.split('').select { |num| num.to_i.to_s == num }.join
  end

  def remove_one
    @phone_number = @phone_number.split('').drop(1).join
  end

  def valid?
    valid_size? && valid_first_digit?
  end

  def valid_digits?
    !@phone_number.match(/[a-zA-Z]/)
  end

  def valid_first_digit?
    return true if @phone_number.size == TEN || @phone_number[0] == ONE
  end

  def valid_size?
    return false if @phone_number.size > ELEVEN
    return false if @phone_number.size < TEN
    true
  end
end
