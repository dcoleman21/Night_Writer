require 'minitest/autorun'
require 'minitest/pride'
require './lib/translator'

class TranslatorTest < Minitest::Test

  def test_it_exists
    translator = Translator.new
    assert_instance_of Translator, translator
  end

  def test_can_split_characters_in_message
    translator = Translator.new
    assert_equal ["h", "e", "l", "l", "o"], translator.split_characters("hello")
  end

  def test_translate_each_character
    translator = Translator.new
    assert_equal [["0.", "00", ".."]], translator.translate_to_braille(["h"])
    assert_equal [["00", ".0", ".."]], translator.translate_to_braille(["d"])
  end

  def test_translate_multiple_characters
    translator = Translator.new
    expected1 = [["00", ".0", "00"], ["0.", ".0", "0."]]
    expected2 = [["0.", "00", ".."],
                 ["0.", ".0", ".."],
                 ["0.", "0.", "0."],
                 ["0.", "0.", "0."],
                 ["0.", ".0", "0."]]
    assert_equal expected1, translator.translate_to_braille(["y", "o"])
    assert_equal expected2, translator.translate_to_braille(["h", "e", "l", "l", "o"])
  end

  def test_combine_rows_and_columns_to_create_grid
    translator = Translator.new
    actual = [["0.", "00", ".."],
              ["0.", ".0", ".."],
              ["0.", "0.", "0."],
              ["0.", "0.", "0."],
              ["0.", ".0", "0."]]

    expected = [["0.", "0.", "0.", "0.", "0."],
                ["00", ".0", "0.", "0.", ".0"],
                ["..", "..", "0.", "0.", "0."]]

    assert_equal expected, translator.transpose(actual)
  end

  def test_combine_to_create_strings
    translator = Translator.new
    actual = [["0.", "0.", "0.", "0.", "0."],
              ["00", ".0", "0.", "0.", ".0"],
              ["..", "..", "0.", "0.", "0."]]

    expected = ["0.0.0.0.0.", "00.00.0..0", "....0.0.0."]

    assert_equal expected, translator.create_strings(actual)
  end

  def test_format_lines_up_to_eighty
    translator = Translator.new
    actual = ["0.0.0.0.0.", "00.00.0..0", "....0.0.0."]

    expected = "0.0.0.0.0.\n00.00.0..0\n....0.0.0."

    assert_equal expected, translator.format_lines(actual)
  end

  def test_can_format_lines_beyond_eighty
    translator = Translator.new
    input = ["0.0.0.0.0.00.00.0..0....0.0.0.0.0.0.0.0.00.00.0..0....0.0.0.",
              "0.0.0.0.0.00.00.0..0....0.0.0.0.0.0.0.0.00.00.0..0....0.0.0."]

    expected = "0.0.0.0.0.00.00.0..0....0.0.0.0.0.0.0.0.00.00.0..0....0.0.0.\n0.0.0.0.0.00.00.0..0....0.0.0.0.0.0.0.0.00.00.0..0....0.0.0."

    assert_equal expected, translator.format_lines(input)
  end

  def test_encode_to_braille
    translator = Translator.new

    input = "helloworld"

    expected = "0.0.0.0.0..00.0.0.00\n00.00.0..000.0000..0\n....0.0.0..00.0.0..."
    
    assert_equal expected, translator.encode_to_braille(input)
  end
# #w
# [".0", "00", ".0"]
# #o
# ["0.", ".0", "0."]
# #r
# ["0.", "00", "0."]
# #l
# ["0.", "0.", "0."]
# #d
# ["00", ".0", ".."]
end
