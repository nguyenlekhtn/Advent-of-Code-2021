class Graph
  attr_reader :row_length, :column_length, :array

  def initialize(row_length:, column_length:, array:)
    @row_length = row_length
    @column_length = column_length
    @array = array
  end
  def value_at(location)
    row, column = location

    array[column][row]
  end

  def neighbours(start_row, start_column)
    adjacent_index = [[0, 1], [0, -1], [1, 0], [-1, 0]]
    adjacent_index.map { |row_index, column_index| [start_row + row_index, start_column + column_index] }
                  .select { |row, column| in_range?(row, column) }
  end

  private

  def in_range?(row, column)
    row.between?(0, row_length - 1) && column.between?(0, column_length - 1)
  end
end
