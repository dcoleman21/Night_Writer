require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_writer_class'
# require './lib/reader_file'

class NightWriterTest < Minitest::Test

  def test_is_exists
    message = "message.txt"
    braille = "braille.txt"
    ARGV[0] = message
    ARGV[1] = braille
    night_writer = NightWriter.new(message, braille)

    assert_instance_of NightWriter, night_writer
  end


end
