

class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(name, height, weight)
    @name = name
    @height = height
    @weight = weight
  end

  def change_info ( name, height, weight )
    self.name = name
    self.height = height
    self.weight = weight
  end

  def speak
    puts "#{name} says argf"
  end

  def info
    puts "#{self.name} | #{self.height} | #{self.weight}"
  end
end


sparky = GoodDog.new('sparky',3, 88)

sparky.speak
puts sparky.name
puts sparky.info
sparky.change_info('sp',4,44)
sparky.info
puts '-----------------'
frido = GoodDog.new('frido', 4, 77)
frido.speak
puts frido.name
frido.info
frido.change_info('fr',5,55)
frido.info

