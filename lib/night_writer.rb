require_relative 'alpha_to_braille'

in_file = File.open(ARGV[0], "r")
message = in_file.read.chomp
alpha_to_braille = AlphaToBraille.new
translated = alpha_to_braille.to_braille(message)
in_file.close

out_file = File.open(ARGV[1], "w")
out_file.write(translated)
out_file.close

puts "Created #{ARGV[1]} containing #{message.length} characters"

#ruby ./lib/night_writer.rb message.txt braille.txt
