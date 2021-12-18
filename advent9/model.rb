require_relative 'bfs'

class Model
  attr_reader :array

  def initialize(array)
    @array = array
  end

  def value_at(location)
    row, column = location
    array[column][row]
  end
  
  def risk_level(low_point)
    value_at(low_point) + 1
  end
  
  def sum_risk_level
    low_points.map { |low_point| risk_level(low_point) }.sum
  end

  def low_points
    column_length = array.length
    row_length = array[0].length
    search = BFS.new(length: [row_length, column_length], array: array)
    search.search_low_points([0, 0])
  end
end