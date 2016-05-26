words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

group_anagrams = {}

words.each do |element|
  hash_key = element.scan(/\w/).sort.join.to_s
  group_anagrams[hash_key] ||= []
  group_anagrams[hash_key] << element
end
group_anagrams.each_key { |key| p group_anagrams[key] }

