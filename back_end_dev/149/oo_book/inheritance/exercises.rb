

class Animal
  attr_accessor :name
  def initialize(name)
    @name = name
  end

  def speak
    'hello'
  end

end


class GoodDog < Animal
  attr_accessor :weight

  def initialize(name,weight)
    super(name)
    @weight = weight
  end

  def speak
    'from good dog ' + super
  end
end


class GoodCat < Animal
end


d = GoodDog.new('boo',99)
puts d.weight
puts d.name
# c = GoodCat.new

puts d.speak
# puts c.speak
