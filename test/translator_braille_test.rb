require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/translator_braille'

class TranslatorBrailleTest < Minitest::Test

  def test_it_exists
    to_braille = TranslatorBraille.new
    assert_instance_of TranslatorBraille, to_braille
  end

  def test_can_split_characters_in_message
    to_braille = TranslatorBraille.new
    assert_equal ["h", "e", "l", "l", "o"], to_braille.split_characters("hello")
  end

  def test_translate_each_character
    to_braille = TranslatorBraille.new
    assert_equal [["0.", "00", ".."]], to_braille.translate_to_braille(["h"])
    assert_equal [["00", ".0", ".."]], to_braille.translate_to_braille(["d"])
  end

  def test_translate_multiple_characters
    to_braille = TranslatorBraille.new
    expected1 = [["00", ".0", "00"], ["0.", ".0", "0."]]
    expected2 = [["0.", "00", ".."],
                 ["0.", ".0", ".."],
                 ["0.", "0.", "0."],
                 ["0.", "0.", "0."],
                 ["0.", ".0", "0."]]
    assert_equal expected1, to_braille.translate_to_braille(["y", "o"])
    assert_equal expected2, to_braille.translate_to_braille(["h", "e", "l", "l", "o"])
  end

  def test_combine_rows_and_columns_to_create_grid
    to_braille = TranslatorBraille.new
    actual = [["0.", "00", ".."],
              ["0.", ".0", ".."],
              ["0.", "0.", "0."],
              ["0.", "0.", "0."],
              ["0.", ".0", "0."]]

    expected = [["0.", "0.", "0.", "0.", "0."],
                ["00", ".0", "0.", "0.", ".0"],
                ["..", "..", "0.", "0.", "0."]]

    assert_equal expected, to_braille.transpose(actual)
  end

  def test_combine_to_create_strings
    to_braille = TranslatorBraille.new
    actual = [["0.", "0.", "0.", "0.", "0."],
              ["00", ".0", "0.", "0.", ".0"],
              ["..", "..", "0.", "0.", "0."]]

    expected = ["0.0.0.0.0.", "00.00.0..0", "....0.0.0."]

    assert_equal expected, to_braille.create_strings(actual)
  end

  def test_format_lines
    to_braille = TranslatorBraille.new
    actual = ["0.0.0.0.0.", "00.00.0..0", "....0.0.0."]

    expected = "0.0.0.0.0.\n00.00.0..0\n....0.0.0."

    assert_equal expected, to_braille.format_lines(actual)
  end

  def test_keep_lines_under_eighty
    to_braille = TranslatorBraille.new
    actual = ["0000000000000000000000000000000000000000000000000000",
              "0000000000000000000000000000000000000000000000000000",
              "0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0."]

    expected = "0000000000000000000000000000000000000000000000000000\n0000000000000000000000000000000000000000000000000000\n0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0."

    assert_equal expected, to_braille.format_long(actual)
  end

  def test_format_lines_over_eighty
    to_braille = TranslatorBraille.new
    actual = ["0000000000000000000000000000000000000000000000000000",
              "0000000000000000000000000000000000000000000000000000",
              "0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0."]
    expected = "0000000000000000000000000000000000000000000000000000\n0000000000000000000000000000000000000000000000000000\n0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0."
    assert_equal expected, to_braille.format_lines(actual)
  end

  def test_encode_to_braille
    to_braille = TranslatorBraille.new

    input = "helloworld"

    expected = "0.0.0.0.0..00.0.0.00\n00.00.0..000.0000..0\n....0.0.0..00.0.0..."

    assert_equal expected, to_braille.encode_to_braille(input)
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
