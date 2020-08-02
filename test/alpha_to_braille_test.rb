require_relative 'test_helper'
require './lib/alpha_to_braille'


class AlphaToBrailleTest < Minitest::Test

  def setup
    @alpha_to_braille = AlphaToBraille.new
  end

  def test_it_exists
    assert_instance_of AlphaToBraille, @alpha_to_braille
  end

  def test_it_can_convert_english_to_braille
    expected = "0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0..."
    actual = @alpha_to_braille.to_braille("hello world")

    puts "Expected:\n#{expected}"
    puts ""
    puts ""
    puts "Actual:\n#{@alpha_to_braille.to_braille("hello world")}"

    assert_equal expected, actual
  end

  def test_it_can_return_new_line_if_over_80_characters
    expected = "0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.\n................................................................................\n................................................................................\n0.\n..\n.."

    actual = @alpha_to_braille.to_braille("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
    assert_equal expected, actual
  end
end
