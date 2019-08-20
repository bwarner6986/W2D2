module Slideable

  def moves 
    possible_moves = Array.new
    move_dirs.each do |(dx, dy)|
      possible_moves << grow_unblocked_moves_in_dir(dx, dy)
    end

    # # possible_moves << new_pos
    # end
  possible_moves.flatten(1)
  end

  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  private
  HORIZONTAL_DIRS = [
    [-1,0],
    [0, 1],
    [1, 0],
    [0,-1],
  ]

  DIAGONAL_DIRS = [
    [-1, 1],
    [1, 1],
    [1, -1],
    [-1,-1],
  ]

  def move_dirs
    raise "You forgot to build move_dirs!!!"
  end

  def grow_unblocked_moves_in_dir(dx, dy)
    moves_grown = []
    cur_x, cur_y = pos
    until board[[cur_x, cur_y]].color != :colorless || [cur_x, cuy_y].any? {|cord| cord < 0 || cord > 7}
      fut_x, fut_y = cur_x + dx, cur_y + dy
      if board[[fut_x, fut_y]].color != self.color
        moves_grown << [fut_x, fut_y]
        cur_x, cur_y = fut_x, fut_y
      else
        break
      end
    end
    moves_grown 
  end

end