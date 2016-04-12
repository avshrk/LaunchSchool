h = {a:1, b:2, c:3, d:4}

# puts h[:b]

h[:e] = 5

h.delete_if { |k,v| v < 3.5}



ar = [ {one: 1, two: 2, three:3},{ jan: 1, feb: 2, mar:3}]
# puts ar[0][:one]
#

hs = { numbers: [1,2,3,4], months: ['jan','feb']}
puts hs[:months][0]
