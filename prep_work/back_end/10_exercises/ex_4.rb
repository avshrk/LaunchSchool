ars = Array(1..10)

ars.unshift(0)
ars.push(11)

 puts ars
 puts '================'


ars.pop
ars.push(3)
ars.each { |v| puts v }
 puts '================'
 ars.uniq!
 puts ars
