# frozen_string_literal: true

class ChessBoard
  attr_accessor :board, :knight

  def initialize
    @board = create_board
    @knight = Knight.new
  end

  def create_board
    board = Array.new(8) { Array.new(8) }
    board.each_with_index do |row, row_index|
      row.each_with_index do |column, column_index|
        board[row_index][column_index] = [row_index, column_index]
      end
    end
    board
  end
end

class Knight
  attr_accessor :start, :finish, :position,  :moves
  attr_reader :board

  def initialize(start = [0,1], finish = [0,0])
    @start = start
    @finish = finish
    @position = start
    @moves = []
  end
  
  def knight_moves(start, finish)
    knight = Knight.new(start, finish)
    knight.knight_moves
  end
end
