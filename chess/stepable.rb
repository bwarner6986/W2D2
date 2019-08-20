module Stepable

  def moves
    possible_moves = Array.new
    cur_x, cur_y = pos
    move_diffs.each do |(dx, dy)|
      new_pos = [cur_x + dx, cur_y + dy]
      possible_moves << new_pos
    end
    possible_moves
  end

  private
  def move_diffs
    raise "You forgot to build move_diffs!!!"
  end
end