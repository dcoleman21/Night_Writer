#require_relative 'braille_convert'

input_file = ARGV[0]
output_file = ARGV[1]
braille = File.read(input_file)
message = BrailleConvert.to_text(braille)

File.write(output_file, message)

puts "Created '#{output_file}' containing #{message.chars.count} characters"
