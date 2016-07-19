


class GoodDog
  @@num_of_gooddogs = 0

  def initialize
    @@num_of_gooddogs += 1
  end

  def self.total_number_of_gooddogs
    @@num_of_gooddogs
  end
end


puts GoodDog.total_number_of_gooddogs

a = GoodDog.new
b = GoodDog.new
puts GoodDog.total_number_of_gooddogs



