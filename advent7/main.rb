path = 'advent7/input.txt'
raise "No find #{path}" unless File.exist?(path)

file = File.open(path)
file_data = file.read
file.close

data = file_data.split(',').map(&:to_i)

def sum_distance_from_x(tally, x)
  tally.map { |k, v| distance_to_energy((k - x).abs) * v }.sum
end

def distance_to_energy(distance)
  return 0 if distance == 0
  return 1 if distance == 1

  distance + distance_to_energy(distance - 1)
end

def find_min(arr)
  tally = arr.tally
  max_x = tally.keys.max
  min_distance = max_x.times.reduce(Float::INFINITY) do |min, i|
    sum = sum_distance_from_x(tally, i)
    sum < min ? sum : min
  end

  p min_distance
end

find_min(data)