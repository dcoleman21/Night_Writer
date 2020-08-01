# require_relative 'reader_file'
require_relative 'translator_braille'
class ReaderFile #reads from message.txt file
  def read
    first_message = ARGV[0]
    File.read(first_message).chomp
  end
end

class NightWriter
  attr_reader :reader_file,
              :message,
              :braille

  def initialize(message, braille)
    @reader = ReaderFile.new
    @message = @reader.read
    @translator = TranslatorBraille.new
    @braille = braille
    command_line_output
    encode_message_to_braille
  end

  def encode_message_to_braille
    message = @message.gsub(" ", "")
    encoded = @translator.encode_to_braille(message)
    File.write(@braille, encoded)
  end

  def command_line_output
    puts "Created '#{@braille}' containing #{@message.length} characters"
  end
end

# puts ARGV.inspect
