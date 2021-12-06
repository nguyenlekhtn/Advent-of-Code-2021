path = 'advent1/input.txt'
raise 'No file' unless File.exists?(path)

file = File.open(path)
file_data = file.readlines.map(&:chomp)
file.close

data_arr = file_data.map(&:to_i)
previous_measurements = data_arr[0...-1]
next_measurements = data_arr[1..]

pair = previous_measurements.zip(next_measurements)
p pair.count { |previous, after | previous < after }