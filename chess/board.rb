require_relative 'piece'
# require_relative './null_piece.rb'
require 'byebug'

class Board

  def initialize
    @grid = Array.new(8) {Array.new(8)}
    
    # @grid.each_with_index do |row, row_idx|
    #   debugger
    #   row.each do |col|
    #     debugger
    #     if [0, 1, 6 ,7].include?(row_idx)
    #       debugger
    #       col = Piece.new
    #     # else
    #     #   col = NullPiece.new
    #     end
    #   end

    (0..7).each do |i|
      (0..7).each do |j|
        if [0, 1, 6 ,7].include?(i)
          @grid[i][j] = Piece.new
        end
      end
    end

    # private
  end

  def move_piece(start_pos, end_pos)
    x_start, y_start = start_pos
    x_end, y_end = end_pos
    piece = @grid[x_start][y_start] 

    raise "This position is empty!" if piece.is_a?(NullPiece)
    raise "Not a valid move" unless valid_pos?(end_pos)

    @grid[x_end][y_end] = piece
    @grid[x_start][y_start] = NullPiece.new
  end

  def move_piece!(start_pos, end_pos)
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, val)
    x, y = pos
    @grid[x][y] = val
  end

  def valid_pos?(pos)
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