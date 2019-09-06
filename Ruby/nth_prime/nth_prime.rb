require 'byebug'

class Prime
  def self.nth(nth_prime)
    valid_input?(nth_prime)
    return [nil, 2, 3, 5][nth_prime] if nth_prime < 4
    prime_count = 3
    counter = 6

    loop do
      prime_count += 1 if counter.odd? && prime?(counter)
      break if prime_count == nth_prime
      counter += 1
    end
    counter
  end

  def self.prime?(counter)
    counter_sqrt = Math.sqrt(counter)
    return false if counter_sqrt == counter_sqrt.floor
    (3..counter_sqrt.floor).step(2).each do |divisor|
      return false if (counter % divisor).zero?
    end
    true
  end

  def self.valid_input?(number)
    raise ArgumentError, "Invalid! Integer Required." unless number.is_a? Integer
    raise ArgumentError, "Invalid! Number > 0." unless number.positive?
  end
end
