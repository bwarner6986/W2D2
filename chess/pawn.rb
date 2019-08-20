require_relative 'piece'

class Pawn < Piece

  def symbol
    @symbol = color == :black ? "♟" : "♙"
  end

  def move_dirs

  end

  private
  def at_start_row?
    (color == :black && pos[0] == 1) || (color == :white && pos[0] == 6)  
  end

  def forward_dir
    color == :black ? 1 : -1
  end

  def forward_steps
    at_start_row? ? [1, 2] : [1]
  end

  def side_attacks
  end

end

