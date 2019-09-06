
class BeesWax
  attr_accessor :type
  def initialize(type)
    @type = type
  end
  def describe_type
    puts "I am a #{type} of Bees Wax"
  end
end

bx = BeesWax.new('blue')
bx.describe_type
