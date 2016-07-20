class Pet

  def run
    'running!'
  end

  def jump
    'jumping!'
  end

end

class Dog < Pet

  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end

  def fetch
    'fetching!'
  end
end

class Cat < Pet

  def speak
    'Meawww'
  end

end

pete = Pet.new
kitty = Cat.new
dave = Dog.new

puts pete.run                # => "running!"

puts kitty.run               # => "running!"
puts kitty.speak             # => "meow!"

puts dave.speak              # => "bark!"

