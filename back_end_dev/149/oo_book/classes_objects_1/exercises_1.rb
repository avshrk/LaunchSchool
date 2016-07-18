
class MyCar
  attr_accessor :color
  attr_reader :year

  def initialize(year,color,model)
    @year = year
    @color = color
    @model = model
    @current_speed = 0
  end

  def spray_paint(color)
    self.color = color
  end

  def speed_up(number)
    @current_speed += number
  end

  def break(number)
    @current_speed -= number
  end

  def shut_down
    @current_speed = 0
  end

  def current_speed
    puts "current speed is #{@current_speed} "
  end

end


t = MyCar.new(2011,'grey','toyota')
puts t.year
puts t.color
t.speed_up(50)
puts t.current_speed
t.break(20)
puts t.current_speed
t.shut_down
puts t.current_speed
t.spray_paint('red')
puts t.color
