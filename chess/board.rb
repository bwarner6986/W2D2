require_relative 'piece'
require 'byebug'
require_relative 'rook'
require_relative 'knight'
require_relative 'bishop'
require_relative 'king'
require_relative 'queen'
require_relative 'pawn'
require_relative 'null_piece'

class Board

  attr_reader :grid

  def initialize
    @grid = Array.new(8) {Array.new(8)}

    @sentinel = NullPiece.instance

    (0..7).each do |i|
      color = [0, 1].include?(i) ? :black : :white
      (0..7).each do |j|
        if i == 0 || i == 7
          if j == 0 || j == 7
            grid[i][j] = Rook.new(color, self, [i,j])
          elsif j == 1 || j == 6
            grid[i][j] = Knight.new(color, self, [i,j])
          elsif j == 2 || j == 5
            grid[i][j] = Bishop.new(color, self, [i,j])
          elsif j == 3
            grid[i][j] = King.new(color, self, [i,j])
          elsif j == 4
            grid[i][j] = Queen.new(color, self, [i,j])
          end
        elsif i == 1 || i == 6
          grid[i][j] = Pawn.new(color, self, [i,j])
        else
          grid[i][j] = @sentinel
        end
      end
    end

  end

  def move_piece(start_pos, end_pos)
    x_start, y_start = start_pos
    x_end, y_end = end_pos
    piece = grid[x_start][y_start] 

    raise "This position is empty!" if piece.is_a?(NullPiece)
    raise "Not a valid move" unless valid_pos?(end_pos)

    grid[x_end][y_end] = piece
    piece.pos = end_pos
    grid[x_start][y_start] = @sentinel
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
    return (0..7).include?(x) && (0..7).include?(y) && grid[x][y] = @sentinel
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