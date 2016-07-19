
class Box
  COMPANY = 'Tata Co'
  WEIGHT = 50
  puts self.inspect
  puts '------'
  puts self.name

  @@count = 0
  def initialize(h,w)
    @height, @width = h, w
    @@count += 1
  end

  def print_width
    @width
  end

  def print_height
    @height
  end

  def set_width=(v)
    @width = v
  end

  def set_height=(v)
    @height = v
  end

  def get_area
    @height * @width
  end

  def self.print_count
    @@count
  end

  def +(other)
    Box.new(@height + other.print_height, @width + other.print_width)
  end

  def -@
    Box.new(-@height,-@width)
  end

  def *(other)
    Box.new(@height * other.print_height, @width * other.print_width)
  end

  def to_s
    "W:#@width H:#@height"
  end
end
puts 'box company info'
puts Box::COMPANY
box1 = Box.new(10,20)
box2 = Box.new(11,22)
puts 'box1'
puts box1
puts 'box2'
puts box2
box3 = box1 + box2
puts 'box3'
puts box3
puts 'negate box3'
box4 =  -box3
puts 'box4 negated'
puts box4
puts 'multiply'
puts box1 * box2
puts Box.print_count
puts
puts box1.print_width
puts box2.print_height
puts box1

box1.set_height = 99
box2.set_width = 88

puts box1.print_height
puts box2.print_width
puts box2.get_area


