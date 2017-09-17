require_relative '../../lib/figure'

class Bishop < Figure
  def initialize(position, owner, sign)
    super(position, owner, sign)
  end
end