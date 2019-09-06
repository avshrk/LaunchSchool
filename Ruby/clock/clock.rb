require 'byebug'

class Clock
  MINUTES_IN_HOUR = 60
  MAX_TIME = 24

  def initialize(hour, minutes = 0)
    @total_minutes = (hour * MINUTES_IN_HOUR) + minutes
  end

  def self.at(hour, minutes = 0)
    new(hour, minutes)
  end

  def -(minutes)
    @total_minutes += MAX_TIME * MINUTES_IN_HOUR if minutes > @total_minutes
    @total_minutes -= minutes
    self
  end

  def +(minutes)
    @total_minutes += minutes
    self
  end

  def ==(other_clock)
    time == other_clock.time
  end

  def time
    @total_minutes
  end

  def to_s
    format("%02d:%02d", hours, minutes)
  end

  private

  def hours
    hour = time / MINUTES_IN_HOUR
    hour < MAX_TIME ? hour : hour - MAX_TIME
  end

  def minutes
    @total_minutes % MINUTES_IN_HOUR
  end
end
