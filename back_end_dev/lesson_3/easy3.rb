# Q1
p flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]

p flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# @2
p flintstones << 'Dino'

# Q3
p flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.concat(['Dino'])
p flintstones

p flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.push('Dino')
p flintstones

p flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.concat(['Dino','Hoppy'])
p flintstones

p flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.concat(%w(Dino Hoppy))
p flintstones

# Q4
advice = "Few things in life are as important as house training your pet dinosaur."
p advice.slice!(0...advice.index('house'))
p advice

advice = "Few things in life are as important as house training your pet dinosaur."
p advice.slice!(0,advice.index('house'))
p advice

advice = "Few things in life are as important as house training your pet dinosaur."
p advice.slice(0...advice.index('house'))
p advice

# Q5
statement = "The Flintstones Rock!"
p statement.scan('t').count
p statement.scan('Rock').count

# Q6
title = "Flintstone Family Members"
p title.center(40)



