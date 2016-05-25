
talk = Proc.new do
  puts 'talk talk talk'
end

talk.call

tweet = Proc.new do |arg|
  puts "tweet #{arg}"
end

tweet.call('avshar')
