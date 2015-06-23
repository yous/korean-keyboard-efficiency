class Keyboard
  ROWS = [['123456', '7890'],
          ['qwert', 'yuiop'],
          ['asdfg', 'hjkl;\''],
          ['zxcvb', 'nm,./']]
  SHIFT_ROWS = [['!@#$%^', '&*()'],
                ['QWERT', 'YUIOP'],
                ['ASDFG', 'HJKL:"'],
                ['ZXCVB', 'NM<>?']]

  def initialize
    @positions = {}
    [ROWS, SHIFT_ROWS].each_with_index do |keyboard, shift|
      keyboard.each_with_index do |total_row, row_idx|
        total_row.each_with_index do |row, hand|
          row.each_char.with_index do |ch, i|
            if hand == 0
              @positions[ch] = [hand, row_idx, (3 - i).abs, shift == 1]
            else
              if row_idx == 0
                @positions[ch] = [hand, row_idx, i, shift == 1]
              else
                @positions[ch] = [hand, row_idx, (1 - i).abs, shift == 1]
              end
            end
          end
        end
      end
    end
  end

  def position(ch)
    @positions[ch]
  end
end
