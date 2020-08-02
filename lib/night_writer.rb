require 'csv'
require_relative 'alpha_to_braille'
require_relative 'braille_to_alpha'

class NightWriter
  attr_reader :message,
              :braille,
              :reader


  def initialize(message, braille)
    @message = "message.txt"
    @braille = "braille.txt"
    @reader = File.new("message.txt")
  end

#   def encode_file_to_braille
#     plain = reader.read
#     braille = to_braille(string)
#
#     write_encoded_braille_to_text_file(braille)
#   end
#
#   def encode_to_braille(input)
#     braille_1 = AlphaToBraille.new
#     braille_1.to_braille(input)
#     # braille_1.braille_translation
#   end
#
#   def write_encoded_braille_to_text_file(braille)
#     File.write("braille.txt", braille)
#   end
#   # english = BRAILLE_HASH.invert
#
end
# new_night_writer = NightWriter.new
# new_night_writer.encode_file_to_braille
