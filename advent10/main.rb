require_relative '../parse_input'

class Model
  attr_reader :open_arr, :close_arr

  include ParseInput

  def initialize(path)
    @path = path
    @open_arr = ['(', '[', '{', '<']
    @close_arr = [')', ']',  '}', '>']
  end

  def display_part1_score
    puts "Part 1 score: #{total_error_score}"
  end

  def display_part2_score
    puts "Part 2 score: #{completion_score_from_data(data)}"
  end

  private

  def total_error_score
    data.map { |line| get_illegal_char(line) }.compact.map { |char| error_score(char) }.sum
  end

  def completion_score_from_data(lines)
    # require 'pry-byebug'; binding.pry
    incomplete_open_arr = lines.map { |line| remove_all_pair(line) }.compact
    incomplete_close_arr = incomplete_open_arr.map { |element| incomplete_open_to_close(element) }
    sorted_score_arr = incomplete_close_arr.map { |element| arr_to_completion_score(element) }.sort
    sorted_score_arr[sorted_score_arr.length / 2]
  end

  def pair?(open, close)
    open_to_close(open) == close
  end

  def open_to_close(open_char)
    open_index = open_arr.find_index(open_char)
    raise 'Invalid  open char' if open_index.nil?

    close_arr[open_index]
  end

  def get_illegal_char(line)
    stack = []
    line.each do |char|
      if open_arr.include?(char)
        stack.push(char)
      else
        return char unless pair?(stack[-1], char)

        stack.pop
      end
    end
    nil
  end

  def error_score(char)
    {
      ')' => 3,
      ']' => 57,
      '}' => 1197,
      '>' => 25_137
    }[char]
  end

  def completion_score(char)
    {
      ')' => 1,
      ']' => 2,
      '}' => 3,
      '>' => 4
    }[char]
  end

  def arr_to_completion_score(arr)
    arr.reduce(0) do  |score, i|
      score * 5 + completion_score(i)
    end
  end

  def remove_all_pair(incomplete_line)
    incomplete_opens = incomplete_line.each_with_object([]) do |item, arr|
      if open_arr.include?(item)
        arr.push(item)
      else
        return nil unless pair?(arr[-1], item)

        arr.pop
      end
    end

    incomplete_opens
  end

  def incomplete_open_to_close(incomplete_opens)
    incomplete_opens.reverse.map { |char| open_to_close(char) }
  end
end

path = 'advent10/input.txt'
model = Model.new(path)
model.display_part1_score
model.display_part2_score
