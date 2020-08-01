require_relative 'translator_braille'

class TranslatorEnglish
  attr_reader :english_hash

  def initialize
    to_braille = TranslatorBraille.new
    @english_hash = to_braille.braille_hash.invert
  end


end
