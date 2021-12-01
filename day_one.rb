
#part 1
input = File.open("input_day_1.txt")
input_arr = input.read.split.map(&:to_i)
p1_count = 0

input_arr.each_with_index do | entry, i|
  unless i == 0
    if entry.to_i > input_arr[i-1].to_i
      p1_count += 1
    end
  end
end

p "Count p1 = #{p1_count}"

#part 2
current_slide = input_arr[0] + input_arr[1] + input_arr[2]
next_slide = 0
p2_count = 0

input_arr.each_with_index do | entry, i|
  if i == input_arr.length - 3
    break
  end
  next_slide = input_arr[i+1] + input_arr[i+2] + input_arr[i+3]
  if next_slide > current_slide
    p2_count += 1
  end
  current_slide = next_slide
end

p "Count p2 = #{p2_count}"
