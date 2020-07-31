require 'minitest/autorun'
require 'minitest/pride'
require './lib/file_reader'

class FileReaderTest < Minitest::Test

  def test_it_exists
    file_reader = FileReader.new
    assert_instance_of FileReader, file_reader
  end
end
