require_relative 'load'
require_relative 'layout'
require_relative 'layouts'
require_relative 'keyboard'

ADDITION_PER_ROW = 0.5
ADDITION_PER_COLUMN = 0.2
keyboard = Keyboard.new

# Alphabets
puts 'Alphabets'
LAYOUTS.each do |layout|
  hit_count = 0
  ALPHABETS.each do |row|
    syl_hit_count = 0
    if row[2] == '초성'
      str = layout.expand(row[3], initial: true)
    elsif row[2] == '종성'
      str = layout.expand(row[3], final: true)
    else
      str = layout.expand(row[3])
    end
    str.each_char do |ch|
      _hand, row, col, shift = keyboard.position(ch)
      jump = (2 - row).abs
      syl_hit_count += 1 + jump * ADDITION_PER_ROW + col * ADDITION_PER_COLUMN
      if shift
        syl_hit_count += 1 + 1 * ADDITION_PER_ROW + 4 * ADDITION_PER_COLUMN
      end
    end
    hit_count += syl_hit_count * row[1]
  end
  puts "Hit count of #{layout.name}: #{hit_count}"
end
puts

# Syllables
puts 'Syllables'
LAYOUTS.each do |layout|
  hit_count = 0
  SYLLABLES.each do |row|
    hand_position = [2, 2]
    char_hit_count = 0
    layout.expand(row[2]).each_char do |ch|
      hand, next_row, col, shift = keyboard.position(ch)
      jump = (next_row - hand_position[hand]).abs
      char_hit_count += 1 + jump * ADDITION_PER_ROW + col * ADDITION_PER_COLUMN
      hand_position[hand] = next_row
      if shift
        jump = (3 - hand_position[1 - hand]).abs
        char_hit_count += 1 + jump * ADDITION_PER_ROW + 4 * ADDITION_PER_COLUMN
        hand_position[1 - hand] = 3
      end
    end
    hit_count += char_hit_count * row[1]
  end
  puts "Hit count of #{layout.name}: #{hit_count}"
end
puts

# Words
puts 'Words'
LAYOUTS.each do |layout|
  hit_count = 0
  WORDS.each do |row|
    hand_position = [2, 2]
    word_hit_count = 0
    word = row[2].each_char.reduce('') do |a, e|
      ord = e.ord
      if 12_593 <= ord && ord <= 12_622
        a + layout.expand(e, initial: true)
      else
        a + layout.expand(e)
      end
    end
    word.each_char do |ch|
      hand, next_row, col, shift = keyboard.position(ch)
      jump = (next_row - hand_position[hand]).abs
      word_hit_count += 1 + jump * ADDITION_PER_ROW + col * ADDITION_PER_COLUMN
      hand_position[hand] = next_row
      if shift
        jump = (3 - hand_position[1 - hand]).abs
        word_hit_count += 1 + jump * ADDITION_PER_ROW + 4 * ADDITION_PER_COLUMN
        hand_position[1 - hand] = 3
      end
    end
    hit_count += word_hit_count * row[1]
  end
  puts "Hit count of #{layout.name}: #{hit_count}"
end
