require_relative 'piece'
require_relative 'slideable'

class Rook < Piece
  include Slideable

  def symbol
    @symbol = color == :black ? "♜" : "♖"
  end

  protected
  def move_dirs
    horizontal_dirs
  end
end