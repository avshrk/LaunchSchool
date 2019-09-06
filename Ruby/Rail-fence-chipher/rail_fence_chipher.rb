require 'byebug'

  def encode(input_string,rails)
    byebug
    input_chars = input_string.chars
    result = []
    large_step = ( rails - 1 ) * 2

    (0...rails).each do |rail_idx|
      result[rail_idx] = []
      result[rail_idx] << input_chars[rail_idx]
      step = rail_idx
      while step  < input_chars.size - 1
        small_step = large_step - ( rail_idx * 2 )
        break if step + small_step > input_chars.size - 1
        result[rail_idx] << input_chars[step + small_step] unless (small_step == large_step)
        break if step + large_step > input_chars.size - 1
        result[rail_idx] << input_chars[step + large_step]
        step += large_step
      end
      result[rail_idx].join
    end
    result

  end


  p encode('WEAREDISCOVEREDFLEEATONCE',3)


