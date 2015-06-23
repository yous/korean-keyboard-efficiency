require_relative 'utils'
require_relative 'layout'
require 'json'

LAYOUTS = JSON.parse(File.read(Utils.asset_file('layouts.json')))
  .map { |name, mapping| Layout.new(name, mapping) }
