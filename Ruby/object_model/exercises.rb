
module Welcome
  def say_hi
    puts 'hi there'
  end
end

class SomeClass
  include Welcome
end


a_class = SomeClass.new
a_class.say_hi


