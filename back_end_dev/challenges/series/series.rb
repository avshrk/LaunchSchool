
class Series
  def initialize(digits)
    @digits = convert_numeric_array(digits)
  end

  def slices(slice_count)
    raise ArgumentError ,'Slice is larger than the digit size' if slice_count > @digits.size
    slice(slice_count)
  end

  private

  def slice(slice_count)
    digits_array = @digits
    sliced_digits = []
    (@digits.size - (slice_count - 1)).times do
      sliced_digits << digits_array.take(slice_count)
      digits_array = digits_array.drop(1)
    end
    sliced_digits
  end

  def convert_numeric_array(digits)
    digits.each_char.map(&:to_i)
  end
end

