class Layout
  INITIAL_CONSONANTS = 'ㄱㄲㄴㄷㄸㄹㅁㅂㅃㅅㅆㅇㅈㅉㅊㅋㅌㅍㅎ'
  MEDIAL_CONSONANTS = 'ㅏㅐㅑㅒㅓㅔㅕㅖㅗㅘㅙㅚㅛㅜㅝㅞㅟㅠㅡㅢㅣ'
  FINAL_CONSONANTS = 'ㄱㄲㄳㄴㄵㄶㄷㄹㄺㄻㄼㄽㄾㄿㅀㅁㅂㅄㅅㅆㅇㅈㅊㅋㅌㅍㅎ'

  attr_reader :name

  def initialize(name, mapping)
    @name = name
    @mapping = mapping
  end

  def expand(ch, initial: false, final: false)
    result = ''
    ord = ch.ord
    if 12_593 <= ord && ord <= 12_643
      if initial
        result << @mapping['initial'][INITIAL_CONSONANTS.index(ch)]
      elsif final
        result << @mapping['final'][FINAL_CONSONANTS.index(ch)]
      else
        result << @mapping['medial'][MEDIAL_CONSONANTS.index(ch)]
      end
    elsif 44_032 <= ord && ord <= 55_203
      index = ord - 44_032
      result << @mapping['initial'][index / (21 * 28)]
      result << @mapping['medial'][(index / 28) % 21]
      result << @mapping['final'][index % 28 - 1] if index % 28 > 0
    end
    result
  end
end
