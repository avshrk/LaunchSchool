
words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

h = {}
words.each do |v|
  key =  v.split('').sort.join
  if h.has_key?(key)
    h[key].push(v)
  else
    h[key] = [v]
  end
end

h.each do |k,v|
  puts '-------------'
  p v
end
