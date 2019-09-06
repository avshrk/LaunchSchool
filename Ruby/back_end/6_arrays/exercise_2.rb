arr = ['b','a']
p arr
p Array(1..3)
arr = arr.product(Array(1..3))
p arr
arr.first.delete(arr.first.last)
p arr

puts '------------------'

arr = ['b','a']
p arr
p [Array(1..3)]
arr = arr.product([Array(1..3)])
p arr
arr.first.delete(arr.first.last)
p arr
