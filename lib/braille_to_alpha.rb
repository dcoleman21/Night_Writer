require_relative 'translateable'

class BrailleToAlpha
  include Translateable

  def english_hash
    braille_hash.invert.map { |k,v| [k.join, v] }.to_h
  end

  def to_english(braille_string)
    braille_array =  braille_string.split("\n")
    output = []
    (braille_string.length / 3 / 2).times do
      pre_output = []
      pre_output <<  braille_array[0][0..1]
      braille_array[0].slice!(0..1)
      pre_output << braille_array[1][0..1]
      braille_array[1].slice!(0..1)
      pre_output << braille_array[2][0..1]
      braille_array[2].slice!(0..1)
      output << pre_output.join
    end
    output.map { |letter| english_hash[letter] }.join
  end
end
