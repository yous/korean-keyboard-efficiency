require 'csv'

module Utils
  def self.asset_file(name)
    File.join(File.expand_path('../../assets', __FILE__), name)
  end

  def self.parse_stats(str)
    CSV.read(str,
             col_sep: "\t",
             converters: :numeric,
             headers: :first_row).by_row!
  end
end
