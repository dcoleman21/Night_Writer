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
    expected2 = [["0.", "00", ".."], ["0.", ".0", ".."], ["0.", "0.", "0."], ["0.", "0.", "0."], ["0.", ".0", "0."]]
    assert_equal expected1, translator.translate_to_braille(["y", "o"])
    assert_equal expected2, translator.translate_to_braille(["h", "e", "l", "l", "o"])
  end

  def method_name

  end

end
