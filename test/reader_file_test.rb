require 'minitest/autorun'
require 'minitest/pride'
require './lib/reader_file'

class ReaderFileTest < Minitest::Test

  def test_it_exists
    reader_file = ReaderFile.new
    assert_instance_of ReaderFile, reader_file
  end

  def test_can_read
    if ARGV[0] == "message.txt"
      reader_file = ReaderFile.new
      expected = "hello world"
      assert_equal expected, reader_file.read
    end
  end

end
