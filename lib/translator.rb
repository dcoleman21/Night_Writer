class Translator
  attr_reader   :braille_hash

  def initialize
    @braille_hash = {
      "a" => ["0.", "..", ".."],
      "b" => ["0.", "0.", ".."],
      "c" => ["00", "..", ".."],
      "d" => ["00", ".0", ".."],
      "e" => ["0.", ".0", ".."],
      "f" => ["00", "0.", ".."],
      "g" => ["00", "00", ".."],
      "h" => ["0.", "00", ".."],
      "i" => [".0", "0.", ".."],
      "j" => [".0", "00", ".."],
      "k" => ["0.", "..", "0."],
      "l" => ["0.", "0.", "0."],
      "m" => ["00", "..", "0."],
      "n" => ["00", ".0", "0."],
      "o" => ["0.", ".0", "0."],
      "p" => ["00", "0.", "0."],
      "q" => ["00", "00", "0."],
      "r" => ["0.", "00", "0."],
      "s" => [".0", "0.", "0."],
      "t" => [".0", "00", "0."],
      "u" => ["0.", "..", "00"],
      "v" => ["0.", "0.", "00"],
      "w" => [".0", "00", ".0"],
      "x" => ["00", "..", "00"],
      "y" => ["00", ".0", "00"],
      "z" => ["0.", ".0", "00"],
    }
  end

  def split_characters(message)
    message.chars
  end

  def translate_to_braille(char_array)
    char_array.map do |letter|
      @braille_hash[letter]
    end
  end

  def transpose(braille_array)
    braille_array.transpose
  end

  def create_strings(grid)
    lines = []
    grid.each do |line|
      lines << line.join
    end
    lines
  end

  def format_lines(strings)
    if strings[0].length > 80
     format_long(strings)
    else
     strings.join("\n")
    end
  end

  def format_long(strings)
    strings.map do |string|
      string.scan(/.{1,80}/)
    end
  end

  def encode_to_braille(message)
    char_array    = split_characters(message)
    braille_array = translate_to_braille(char_array)
    grid          = transpose(braille_array)
    strings       = create_strings(grid)
    format_lines(strings)
  end
end
