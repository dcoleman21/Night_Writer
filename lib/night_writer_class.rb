require_relative 'reader_file'

class NightWriter
  attr_reader :message
              # :braille

  def initialize(message, braille)
    @reader = ReaderFile.new
    @message = @reader.read
    @braille = braille
    command_line_output
  end

  def command_line_output
    puts "Created '#{@braille}' containing #{@message.chomp.length} characters"
  end
end
