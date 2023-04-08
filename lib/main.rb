# frozen_string_literal: true

require 'pry-byebug'

# ChessBoard class
class ChessBoard
  attr_accessor :board, :knight

  # create a 8x8 chess board
  def initialize
    @board = create_board
  end

  def create_board
    board = Array.new(8) { Array.new(8) }
    board.each_with_index do |row, row_index|
      row.each_with_index do |_column, column_index|
        board[row_index][column_index] = [row_index, column_index]
      end
    end
    board
  end
end

# Knight class
class Knight
  attr_accessor :start, :finish, :possible_moves, :visited, :path
  attr_reader :board

  # create a knight with a starting position and a finish position
  def initialize(start = [0, 1])
    @start = start
    @possible_moves = []
    @visited = [start]
    @path = []
  end

  def min_steps_to_reach_target(knight_pos, target_pos, board_size)
    queue = []
    queue.push([knight_pos[0], knight_pos[1], 0, [0, 0]])
    visited = Array.new(board_size) { Array.new(board_size, false) }
    visited[knight_pos[0]][knight_pos[1]] = true
    row = [2, 1, -1, -2, -2, -1, 1, 2]
    col = [1, 2, 2, 1, -1, -2, -2, -1]
    until queue.empty?
      t = queue[0]
      @possible_moves << queue[0]
      queue.shift
      if t[0] == target_pos[0] && t[1] == target_pos[1]
        return t[2]
      end

      for i in 0..7
        row1 = t[0] + row[i]
        col1 = t[1] + col[i]

        if inside?(row1, col1, board_size) && !visited[row1][col1]
          visited[row1][col1] = true
          queue.push([row1, col1, t[2] + 1, [t[0], t[1]]])
        end
      end
    end
  end

  # find last element in array.  This is the last move made. Iterate through the array
  # and find the prior month add to the array. 
  def find_path(array, number_of_moves)
    array.each do |sub_array|
      sub_array.delete_at(2)
      sub_array << [sub_array[0], sub_array[1]]
      sub_array.delete_at(0)
      sub_array.delete_at(0)
    end
    @path << array.last[1]
    @path << array.last[0]
      @path.each do |move|
        array.each do |sub_array|
          if sub_array[1] == move
            @path << sub_array[0]
          end
        end
      end
    @path.reverse!
    @path.uniq!
    @path.delete_at(0)
    puts "You made it in #{number_of_moves} moves!  Here's your path: #{@path}"
  end

  def inside?(row, col, _matrix_size)
    row >= 0 && row <= 7 && col >= 0 && col <= 7 ? true : false
  end
end
