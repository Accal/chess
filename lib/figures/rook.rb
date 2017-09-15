require_relative '../../lib/figure'

class Rook < Figure
  Value =
  Moves = [[-1, -1], [0, -1], [1, -1], [-1, 0], [1, 0], [-1, 1], [0, 1], [1, 1]].freeze

  def initialize(position, owner, sign)
    super(position, owner, sign)
  end
end