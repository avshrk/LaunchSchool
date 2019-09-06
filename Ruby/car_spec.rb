require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'car'

describe 'Car#wheels' do
  it 'has_four_wheels' do
    Car.new.wheels.must_equal 4
  end

end
