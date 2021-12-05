path = 'input'
raise 'No file' unless File.exists?(path)

file = File.open(path)
file_data = file.readlines.map(&:chomp)
file.close

formalized = file_data.map do |string|
  string.split(' -> ').map{ |location| location.split(',').map(&:to_i) }
end

x_max = formalized.map { |start, goal| [start[0], goal[0]] }.flatten.max
y_max = formalized.map { |start, goal| [start[1], goal[1]] }.flatten.max

def line_to_array(line)
  line => [[x0, y0], [x1, y1]]
  if x0 == x1
    vertical_line_to_array(*line)
  elsif y0 == y1
    horizontal_line_to_array(*line)
  end
end

def reversable_range(start, goal)
  return [] if start == goal

  start < goal ? (start).upto(goal) : (start).downto(goal)
end

def vertical_line_to_array(start, goal)
  start => [x0, y0]
  goal => [x1, y1]
  reversable_range(y0, y1).map { |y| [x0, y] }
end

def horizontal_line_to_array(start, goal)
  start => [x0, y0]
  goal => [x1, y1]
  reversable_range(x0, x1).map { |x| [x, y0] }
end

# def diagonal_line_array(start, goal)
#   start => [x0, y0]
#   goal => [x1, y1]
#   x_range = reversable_range(x0, x1)
#   y_range = reversable_range(y0, y1)
#   x_range.zip(y_range)
# end

init_arr = Array.new(x_max + 1) { Array.new(y_max + 1) {0} }
vent = formalized.each_with_object(init_arr) do |line, arr|
  line_arr = line_to_array(line)
  if line_arr
    line_arr.each do |line_arr|
      x, y = line_arr
      arr[x][y] += 1
    end
  end
end
# vent.transpose.each do |line|
#   p line
# end

p vent.flatten.count { |num| num >= 2}  






# formalized.
