

class MyCar

  def self.gas_milage(gal,miles)
    miles / gal
  end

  def to_s
     'my car class'
  end
end


puts MyCar.gas_milage(13,351)
a = MyCar.new

puts  a
