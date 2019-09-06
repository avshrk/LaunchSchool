require 'byebug'

class Person
  attr_accessor :first_name, :last_name

  def initialize(n)
    parse_full_name n
  end

  def name
    "#{@first_name} #{@last_name}"
  end

  def name=(n)
    parse_full_name n
  end

  def to_s
    name
  end

  private

  def parse_full_name(n)
    names = n.split
    @first_name = names.first
    @last_name = names.size > 1 ? names.last : ''
  end


end

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')

puts bob.name == rob.name
puts bob
