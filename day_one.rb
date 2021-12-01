input = File.open("input_day_1.txt")
input_arr = input.read.split
count = 0

input_arr.each_with_index do | entry, i|
  unless i == 0
    if entry.to_i > input_arr[i-1].to_i
      count += 1
    end
  end
end

p count