#part 1
input = File.open("input_d3.txt")
input_arr = input.read.split
gamma_rate = []
epsilon_rate = []
counter = [0,0,0,0,0,0,0,0,0,0,0,0]

input_arr.each do |line| 
  line.split("").each_with_index do |num, i|
    if num == "1"
      counter[i] += 1
    else 
      counter[i] -= 1
    end
  end
end
p counter

j  = 0

  while j < counter.length do
    if counter[j] > 0
      gamma_rate[j] = 1
      epsilon_rate[j] = 0
    else
      gamma_rate[j] = 0
      epsilon_rate[j] = 1
    end
    j += 1
  end

  p " e: #{epsilon_rate}"
  p "g: #{gamma_rate}"

    def to_decimal(binary)
      binary.reverse.chars.map.with_index do |digit, index|
        digit.to_i * 2**index
      end.sum
    end

    g = to_decimal(gamma_rate.join)
    e = to_decimal(epsilon_rate.join)

    p " e: #{e}"
    p "g: #{g}"
    p "e * g: #{e*g}"

    #part 2

    test_input_arr = ["00100", "11110", "10110", "10111", "10101", "01111", "00111", "11100", "10000", "11001", "00010", "01010"]

    os_arr = input_arr.select{|val| val[0] == "1"}
    co2_arr = input_arr.select{|val| val[0] == "0"}

    def most_common_at(arr, index)
      ones = 0
      zeros = 0
      arr.each do |val|
        ones += val[index].to_i
      end
      zeros = arr.length - ones

      if ones > zeros
        return "1"
      elsif zeros > ones
        return "0"
      else
        return "equal"
      end
    end

    i = 1
    until os_arr.length == 1 do
      ans = most_common_at(os_arr, i)
      if ans == "equal"
        os_arr.select!{|val| val[i] == "1"}
      else
        os_arr.select!{|val| val[i] == ans}
      end
      i += 1
    end

    i = 1

    until co2_arr.length == 1 do
      ans = most_common_at(co2_arr, i)
      if ans == "equal"
        co2_arr.select!{|val| val[i] == "0"}
      else
        co2_arr.select!{|val| val[i] != ans}
      end
      i += 1
    end

    co2 = to_decimal(co2_arr[0])
    os = to_decimal(os_arr[0])

    p co2
    p os
    p co2 * os