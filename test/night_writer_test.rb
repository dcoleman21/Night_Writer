require_relative 'test_helper.rb'
require './lib/night_writer.rb'

class NightWriterTest < Minitest::Test

  def test_is_exists
    message = "message.txt"
    braille = "braille.txt"
    ARGV[0] = message
    ARGV[1] = braille
    night_writer = NightWriter.new(message, braille)

    assert_instance_of NightWriter, night_writer
  end



# class NightWriterTest < Minitest::Test
#
#
#   def test_output_to_file
#     night_writer = NightWriter.new
#
#     assert_equal 0.\n..\n.., night_writer.encode_to_braille("abc")
#   end
# end


end
