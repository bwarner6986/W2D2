require_relative 'piece'
require_relative 'slideable'

class Queen < Piece
  include Slideable

  def symbol
    @symbol = color == :black ? "♛" : "♕"
  end

  protected
  def move_dirs
    [horizontal_dirs, diagonal_dirs].flatten(1)
  end
end