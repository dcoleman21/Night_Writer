require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_writer_class'

class NightReaderTest < Minitest::Test
  def test_it_exists
    message = "message.txt"
    braille = "braille.txt"
    ARGV[0] = message
    ARGV[1] = braille
    night_reader = NightReader.new(message, braille)

    assert_instance_of NightReader, night_reader
  end


end
