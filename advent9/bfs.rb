require_relative 'graph'
require 'set'

class BFS
  attr_reader :graph

  def initialize(length:, array:)
    @graph = Graph.new(row_length: length[0], array: array, column_length: length[1])
  end

  def search_low_points(start)
    queue = Queue.new
    queue.push start
    reached = Set.new
    reached.add start
    low_points = []

    until queue.empty?
      current = queue.pop
      low_points.push(current) if low_point?(current)
      graph.neighbours(*current).each do |neighbour|
        unless reached.include?(neighbour)
          queue.push(neighbour)
          reached.add(neighbour)
        end
      end
    end
    low_points
  end

  def low_point?(current)
    neighbours = graph.neighbours(*current)
    neighbours.all? do |neighbour|
      graph.value_at(current) < graph.value_at(neighbour)
    end
  end
end