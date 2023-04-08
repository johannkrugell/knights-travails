# frozen_string_literal: true

require_relative '../lib/main'
require 'minitest/autorun'
require 'minitest/pride'

class TestKnight < Minitest::Test
  def setup
    @board = ChessBoard.new
    @knight = Knight.new
  end

  def test_chess_board
    assert_equal 8, @board.board.length
    assert_equal 8, @board.board[0].length
  end

  def test_knight_create
    assert_equal [0,1], @knight.start
  end

  def test_min_steps_to_reach_target
    assert_equal 3, @knight.min_steps_to_reach_target([0, 1], [6,2], 64)
  end

  def test_find_path
    tour = @knight.min_steps_to_reach_target([0, 1], [6,2], 64)
    @knight.find_path(@knight.possible_moves, tour)
    assert_equal [[0, 1], [2, 2], [4, 3], [6, 2]], @knight.path
  end
end