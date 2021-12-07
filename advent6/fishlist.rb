class FishList
  def initialize(arr)
    @tally = arr_to_tally(arr)
  end

  def after_one_day
    @tally = tally_after_one_day
  end

  def tally_after_one_day
    # require 'pry-byebug'; binding.pry
    current_tally = Hash.new(0)
    8.times.each do |i|
      current_tally[i] = @tally[i + 1]
    end
    current_tally[6] += @tally[0]
    current_tally[8] += @tally[0]
    current_tally
  end

  def arr_to_tally(arr)
    tally = arr.tally
    9.times do |i|
      if tally[i].nil?
        tally[i] = 0
      end
    end
    tally
  end

  def after_n_days(n)
    n.times.each { |i| after_one_day }
    p @tally
  end

  def length
    @tally.values.sum
  end
end