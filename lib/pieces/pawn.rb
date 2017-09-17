require_relative '../../lib/figure'

class Pawn < Figure
  Moves = [[-1, -1], [0, -1], [1, -1], [-1, 0], [1, 0], [-1, 1], [0, 1], [1, 1]].freeze

  def initialize(position, owner, sign)
    super(position, owner, sign)
  end

  def can_move?(goal)
    Moves.each do |x, y|
      if @position[0] + x == goal[0] && @position[1] + y == goal[1]
        true
      else
        false
      end
    end
  end
end