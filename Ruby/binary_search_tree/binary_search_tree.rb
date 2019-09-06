
# frozen_string_literal: true
#

class Bst
  attr_reader :left, :right, :data

  def initialize(data)
    @data = data
  end

  def insert(new_data)
    new_data > data ? insert_right(new_data) : insert_left(new_data)
  end

  def each(&block)
    return enum_for :each unless block_given?

    # &. Safe navigation operator: as of 2.3.0
    @left&.each(&block)
    yield(data)
    @right&.each(&block)
  end

  private

  def insert_right(new_data)
    @right&.insert(new_data) || @right = Bst.new(new_data)
  end

  def insert_left(new_data)
    @left&.insert(new_data) || @left = Bst.new(new_data)
  end
end
