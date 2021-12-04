input = File.open("input_d4.txt")

test_input = """7,4,9,5,11,17,23,2,0,14,21,24,10,16,13,6,15,25,12,22,18,20,8,19,3,26,1
22 13 17 11  0
 8  2 23  4 24
21  9 14 16  7
 6 10  3 18  5
 1 12 20 15 19

 3 15  0  2 22
 9 18 13 17  5
19  8  7 25 23
20 11 10 24  4
14 21 16 12  6

14 21 17 24  4
10 16 15  9 19
18  8 23 26 20
22 11 13  6  5
 2  0 12  3  7"""
 
input_arr = input.read.split

#input_arr = test_input.split

selections = input_arr[0]

board_data = input_arr[1..]

@num_count = 0

def make_board(board_arr)
  board = []
  i = 0
  j = 0
  while i < 5 do
    board[i] = board_arr[j..j+4]
    i += 1
    j += 5
  end
  return board
end

boards = []
i = 0

while i < board_data.length - 24 do
  boards.append(make_board(board_data[i..i+24]))
  i += 25
end

test_board = [["86", "46", "47", "61", "57"], ["X", "74", "X", "X", "X"], ["78", "8", "54", "55", "97"], ["11", "90", "7", "75", "70"], ["81", "50", "84", "10", "60"]]

def check_board(board)
  board.each do |row|
    if row.count("X") == 5
      return "Winner"
    end

    i = 0

    while i < 5
      if (board.select {|row| row[i] == "X"}).length == 5
        return "Winner"
      end
      i += 1
    end
  end
  "Loser"
end

def calculate_winner(winning_board, last_num)
  total = 0
  winning_board.each do |row|
    row
    row.each do |square|
      if square != "X"
        total += square.to_i
      end
    end
  end
  return total * last_num.to_i
end

def mark_board(num, board)
  board.each do |row|
    row.each_with_index do |square, index|
      if square == num
        row[index] = "X"
        if @num_count >= 5
          if check_board(board) == "Winner"
            return "BINGO"
          end
        end
        return board
      end
    end
  end
  board
end

# selections.split(",").each do |call_num|
#   boards.each do |board|
#     if mark_board(call_num, board) == "BINGO"
#       p calculate_winner(board, call_num)
#       exit
#     else
#       board = mark_board(call_num, board) 
#     end
#   end
#   @num_count += 1
# end

#part 2
selections.split(",").each_with_index do |call_num, i|
  j = 0
  boards.length.times do
    board = boards[j]
    if mark_board(call_num, board) == "BINGO"
      if i == selections.length-1 || boards.length == 1
        p call_num
        p calculate_winner(board, call_num)
        exit
      else
        boards.delete_at(j)
        j -= 1
      end
    else
      mark_board(call_num, board) 
    end
    j += 1
  end
  @num_count += 1
end