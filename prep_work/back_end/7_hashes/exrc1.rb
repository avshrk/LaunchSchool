

family = {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"],
            aunts: ["mary","sally","susan"]
}

ar = family.select { |k,v| k == :sisters || k == :brothers }.values.flatten
p ar
