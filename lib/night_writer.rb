require './lib/night_writer_class'

message, braille = ARGV

NightWriter.new(message, braille)
