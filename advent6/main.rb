require_relative 'advent6'

path = 'advent6/input.txt'
raise "No find #{path}" unless File.exist?(path)

file = File.open(path)
file_data = file.read
file.close

data = file_data.split(',').map(&:to_i)
fish_list = FishList.new(data)
fish_list.after_num_days(80)
p fish_list.length