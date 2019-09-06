require 'byebug'

class CircularBuffer
  class BufferFullException < RuntimeError; end
  class BufferEmptyException < RuntimeError; end

  def initialize(buffer_size)
    @buffer_size = buffer_size
    @buffer = []
  end

  def read
    raise BufferEmptyException if empty?
    @buffer.shift
  end

  def write(data)
    raise BufferFullException if full?
    @buffer << data unless data.nil?
  end

  def write!(data)
    return if data.nil?

    if full?
      @buffer.shift
      @buffer << data
    else
      write(data)
    end
  end

  def clear
    @buffer = []
  end

  private

  def full?
    @buffer.size == @buffer_size
  end

  def empty?
    @buffer.empty?
  end
end
