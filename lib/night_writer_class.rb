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

  # def encode_to_braille(message)
  #   #add encode method from translator class
  # end

  def command_line_output
    puts "Created '#{@braille}' containing #{@message.chomp.length} characters"
    File.write(@braille, File.read(ARGV[0])
  end
end
