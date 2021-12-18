require_relative 'model'
path = 'advent9/input.txt'
raise "No find #{path}" unless File.exist?(path)

array = []
File.open(path, chomp: true) do |file|
  array = file.readlines.map(&:chomp).map { |line| line.split('').map(&:to_i) }
end

p Model.new(array).sum_risk_level
