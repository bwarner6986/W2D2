require_relative 'piece'
require 'singleton'

class NullPiece < Piece

  include Singleton

  def initialize
    @color = :colorless
  end

  def moves
  end

  def symbol
    " "
  end

end