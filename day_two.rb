
#part 1
input = File.open("input_d2.txt")
input_arr = input.read.split
depth = 0
horizontal = 0
aim = 0
i = 0
while i < input_arr.length do
  curr_action = input_arr[i]
  val = input_arr[i+1].to_i
  case curr_action
  when "forward"
    horizontal += val
    depth += (aim*val)
  when "down"
    aim += val
  when "up"
    aim -= val
  else
    "err"
  end
  i += 2
end

p "horizontal: #{horizontal}"
p "depth: #{depth}"
p "horizontal * depth: #{(horizontal*depth)}"