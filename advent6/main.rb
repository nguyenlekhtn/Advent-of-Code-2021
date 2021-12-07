# require_relative 'advent6'
# require_relative 'function'
require_relative 'fishlist'

path = 'advent6/input.txt'
raise "No find #{path}" unless File.exist?(path)

file = File.open(path)
file_data = file.read
file.close

data = file_data.split(',').map(&:to_i)
# fish_list = FishList.new(data)
# fish_list.after_num_days(256)
# p fish_list.length

fish_list = FishList.new(data)
fish_list.after_n_days(256)
p fish_list.length