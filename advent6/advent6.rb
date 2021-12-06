class Fish
  attr_reader :list, :timer

  def initialize(list, timer = 8)
    @timer = timer
    @list = list
  end

  def grow

    @timer -= 1
    return unless @timer.negative?

    @timer = 6
    list.new_fish
  end
end

class FishList
  def initialize(arr)
    @list = number_to_fish_list(arr)
  end

  def number_to_fish_list(arr)
    arr.map { |i| Fish.new(self, i) }
  end

  def new_fish
    @list.push(Fish.new(self))
  end

  def after_one_day
    current_length = @list.length

    current_length.times { |i| @list[i].grow }
  end

  def after_num_days(num)
    num.times.each { |_n| after_one_day }
  end

  def length
    @list.length
  end
end
