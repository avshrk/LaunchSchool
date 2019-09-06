
class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end


s = Cat.new('siyam')
c = Cat.new('cyberian')
v = Cat.new('van')


puts Cat.cats_count

