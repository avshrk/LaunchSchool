class Sieve
  SMALLEST_PRIME = 2

  def initialize(limit)
    @limit = limit
  end

  def primes
    return [] if @limit < SMALLEST_PRIME
    return [SMALLEST_PRIME] if @limit == SMALLEST_PRIME
    extract_primes
  end

  def extract_primes
    primes = (2..@limit).to_a

    (2..@limit).each do |start|
      break if start**2 > @limit
      (start..@limit).each do |multiplier|
        break if start * multiplier > @limit
        primes.delete(start * multiplier)
      end
    end
    primes
  end
end
