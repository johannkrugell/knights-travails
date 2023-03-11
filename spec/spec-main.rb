# frozen_string_literal: true

require_relative '../lib/main'
require 'minitest/autorun'
require 'minitest/pride'

class TestKnight < Minitest::Test
  def setup
    @board = ChessBoard.new
    @knight = Knight.new([0,1], [0,0])
  end

  def test_chess_board
    board = ChessBoard.new
    assert_equal 8, board.board.length
    assert_equal 8, board.board[0].length
  end

  def test_knight_create
    assert_equal [0,1], @knight.start
    assert_equal [0,0], @knight.finish
    assert_equal [0,1], @knight.position
  end
end