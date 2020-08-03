require_relative 'test_helper'

class BrailleToAlphaTest < Minitest::Test

  def setup
    @braille_to_alpha = BrailleToAlpha.new
  end

  def test_it_exists
    assert_instance_of BrailleToAlpha, @braille_to_alpha
  end

  def test_can_invert_braille_hash_to_english_hash
    expected = {
       "0....."=>"a",
       "0.0..."=>"b",
       "00...."=>"c",
       "00.0.."=>"d",
       "0..0.."=>"e",
       "000..."=>"f",
       "0000.."=>"g",
       "0.00.."=>"h",
       ".00..."=>"i",
       ".000.."=>"j",
       "0...0."=>"k",
       "0.0.0."=>"l",
       "00..0."=>"m",
       "00.00."=>"n",
       "0..00."=>"o",
       "000.0."=>"p",
       "00000."=>"q",
       "0.000."=>"r",
       ".00.0."=>"s",
       ".0000."=>"t",
       "0...00"=>"u",
       "0.0.00"=>"v",
       ".000.0"=>"w",
       "00..00"=>"x",
       "00.000"=>"y",
       "0..000"=>"z",
       "......"=>" "
    }

    assert_equal expected, @braille_to_alpha.english_hash
  end

  def test_convert_braille_to_english
    expected = "hello world"
    actual = @braille_to_alpha.to_english("0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...")

    puts "Expected:\n#{expected}"
    puts ""
    puts ""
    puts "Actual:\n#{@braille_to_alpha.to_english("0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...")}"

    assert_equal expected, actual
  end
end
