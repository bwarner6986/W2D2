require_relative 'piece'

class Pawn < Piece

  def symbol
    @symbol = color == :black ? "♟" : "♙"
  end

  def move_dirs
    dirs = Array.new
    cur_x, cur_y = pos
    dx = forward_dir * forward_steps
    fut_pos = [cur_x + dx, cur_y]
    dirs << fut_pos
    dirs += side_attacks
    dirs
  end

  private
  def at_start_row?
    (color == :black && pos[0] == 1) || (color == :white && pos[0] == 6)  
  end

  def forward_dir
    color == :black ? 1 : -1
  end

  def forward_steps
    at_start_row? ? 2 : 1
  end

  def side_attacks
    cur_x, cur_y = pos
    dx = forward_dir * 1
    sides = [[cur_x + dx, cur_y + 1], [cur_x + dx, cur_y - 1]] 
    sides.select { |pos| pos unless board[pos].color == self.color || board[pos].color == :colorless }
  end

end

