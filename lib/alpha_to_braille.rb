require_relative 'translatable'

class AlphaToBraille
  include Translatable

  def to_braille(string)
    output = []
    first_row = string.chars.map { |char| braille_hash[char][0] }
    output << first_row.join
    second_row = string.chars.map { |char| braille_hash[char][1] }
    output << second_row.join
    last_row = string.chars.map { |char| braille_hash[char][2] }
    output << last_row.join
    braille_line_1 = output

    if braille_line_1[0].length > 80
      braille_line_2 = []
      braille_line_2 << braille_line_1[0][80..-1]
      braille_line_1[0].slice!(80..-1)
      braille_line_2 << braille_line_1[1][80..-1]
      braille_line_1[1].slice!(80..-1)
      braille_line_2 << braille_line_1[2][80..-1]
      braille_line_1[2].slice!(80..-1)
      braille_line_1.join("\n") + "\n" + braille_line_2.join("\n")
    else
      braille_line_1.join("\n")
    end
  end
end
