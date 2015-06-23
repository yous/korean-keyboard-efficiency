require_relative 'utils'

ALPHABETS = Utils.parse_stats(Utils.asset_file('자모통계.txt'))
SYLLABLES = Utils.parse_stats(Utils.asset_file('음절통계.txt'))
WORDS = Utils.parse_stats(Utils.asset_file('일반어휘통계.txt'))
