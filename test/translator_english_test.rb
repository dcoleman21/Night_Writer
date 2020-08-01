require 'minitest/autorun'
require 'minitest/pride'
require './lib/translator_english'


class TranslatorEnglishTest < Minitest::Test

  def test_it_exists
    english = TranslatorEnglish.new
    assert_instance_of TranslatorEnglish, english
  end

  # def test_case_name
  #
  # end


end
