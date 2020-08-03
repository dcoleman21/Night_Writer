require_relative 'braille_to_alpha'

in_file = File.open(ARGV[0], "r")
message = in_file.read.chomp
braille_to_alpha = BrailleToAlpha.new
translated = braille_to_alpha.to_english(message)
in_file.close

out_file = File.open(ARGV[1], "w")
out_file.write(translated)
out_file.close

puts "Created #{ARGV[1]} containing #{message.length} characters"


#ruby ./lib/night_reader.rb braille.txt original_message.txt
