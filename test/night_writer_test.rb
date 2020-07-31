require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_writer'
require './lib/file_reader'

class NightWriterTest < Minitest::Test

  def test_is_exists
    night_writer = NightWriter.new
    assert_instance_of NightWriter, night_writer
  end

  def test_can_encode_file_to_braille
    skip
  end

  def test_can_encode_to_braille
    skip
  end

end
