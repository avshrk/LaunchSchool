

def each(ary)
  if block_given?
    i = 0
    while i < ary.size
      yield ary[i]
      i += 1
    end
  end
  ary
end


ar1 = *('a'..'z')

print each(ar1) { |l| print l }
