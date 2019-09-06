family = {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"],
            aunts: ["mary","sally","susan"]
}


arr_new = family.select { |key, values| key == :sisters || key == :brothers }.values.flatten
p arr_new

