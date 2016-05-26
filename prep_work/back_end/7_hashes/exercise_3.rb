colors = { alice_blue: '#F0F8FF', aqua: '#00FFFF' , black: '#000000', brown: '#A52A2A', coral: '#FF7F50' }

colors.each_key { |key| puts key }
colors.each_value { |value| puts value }
colors.each_pair { |key, value| puts key.to_s << ' is ' <<  value }

