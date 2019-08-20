require_relative 'piece'
require_relative 'stepable'

class King < Piece

  include Stepable

  HORIZONTAL_DIFFS = [
    [-1,0],
    [0, 1],
    [1, 0],
    [0,-1],
  ]

  DIAGONAL_DIFFS = [
    [-1, 1],
    [1, 1],
    [1, -1],
    [-1,-1],
  ]

  def symbol
    @symbol = color == :black ? "♚" : "♔"	
  end

  private
  def move_diffs
    [HORIZONTAL_DIFFS, DIAGONAL_DIFFS].flatten(1)
  end

end
