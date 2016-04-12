

def check_word(word,pat)
  /#{pat}/ =~ word
end
a = [ "laboratory" , "experiment" , "Pans Labyrinth" , "elaborate" , "polar bear"]


a.each do |s|
  puts s if check_word(s.downcase,'lab')
end

