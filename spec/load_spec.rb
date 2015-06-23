require 'load'

RSpec.describe 'load' do
  describe 'ALPHABETS' do
    it 'has 4 columns' do
      ALPHABETS.each do |row|
        expect(row.size).to be(4)
      end
    end
  end

  describe 'SYLLABLES' do
    it 'has 3 columns' do
      SYLLABLES.each do |row|
        expect(row.size).to be(3)
      end
    end
  end

  describe 'WORDS' do
    it 'has 5 columns' do
      WORDS.each do |row|
        expect(row.size).to be(5)
      end
    end
  end
end
