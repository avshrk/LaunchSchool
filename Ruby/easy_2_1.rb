
class Oracle
  def predict_the_futurue
    puts "you will " + choices.sample
  end

  def choices
    ['eat','study','work-out']
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

trp = RoadTrip.new
trp.predict_the_futurue
