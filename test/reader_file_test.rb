require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/reader_file'

class ReaderFileTest < Minitest::Test

  def test_is_exists
    message = "message.txt"
    braille = "braille.txt"
    ARGV[0] = message
    ARGV[1] = braille
    reader_file = ReaderFile.new

    assert_instance_of ReaderFile, reader_file
  end


end
