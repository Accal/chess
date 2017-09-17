require_relative '../../lib/figure'

class Knight < Figure
  Moves = [[1, 2], [-1, 2], [1, -2], [-1, -2], [2, 1], [2, -1], [-2, 1], [-2, -1]].freeze

  def initialize(position, owner, sign)
    super(position, owner, sign)
  end
end