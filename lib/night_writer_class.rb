require_relative 'reader_file'
require_relative 'translator'

class NightWriter
  attr_reader :message
  #             :braille

  def initialize(message, braille)
    @reader = ReaderFile.new
    @message = @reader.read
    @translator = Translator.new
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
