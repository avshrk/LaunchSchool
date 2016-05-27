def lab_exist?(word)
 puts word =~ /lab/ ? word : false
end

lab_exist?('labratory')
lab_exist?('experiment')
lab_exist?('Pans Labyrinth')
lab_exist?('elaborate')
lab_exist?('polar bea')
