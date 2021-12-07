def after_one_day(arr)
  arr.map do |i|
    (i - 1).negative? ? [6, 8] : i - 1
  end
end

def after_n_days(n, arr)
  n.times.reduce(arr) do |memo, i|
    after_one_day(memo).flatten
  end.length
end
