require_relative 'piece'
require 'byebug'

class Board

  attr_reader :grid

  def initialize
    @grid = Array.new(8) {Array.new(8)}

    (0..7).each do |i|
      (0..7).each do |j|
        if [0, 1, 6 ,7].include?(i)
          grid[i][j] = Piece.new
        end
      end
    end

  end

  def move_piece(start_pos, end_pos)
    x_start, y_start = start_pos
    x_end, y_end = end_pos
    piece = grid[x_start][y_start] 

    raise "This position is empty!" if piece.nil?
    raise "Not a valid move" unless valid_pos?(end_pos)

    grid[x_end][y_end] = piece
    grid[x_start][y_start] = nil
  end

  def move_piece!(start_pos, end_pos)
  end

  def [](pos)
    x, y = pos
    grid[x][y]
  end

  def []=(pos, val)
    x, y = pos
    grid[x][y] = val
  end

  def valid_pos?(pos)
    x, y = pos
    return (0..7).include?(x) && (0..7).include?(y) && grid[x][y].nil?
  end

  def add_piece(piece, pos)
  end

  def checkmate?(color)
  end

  def in_check?(color)
  end

  def find_king(color)
  end

  def pieces
  end

  def dup
  end
end