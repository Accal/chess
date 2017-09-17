# A base class for figure type objects. Each figure has
# position represented as an array of x and y ([x, y])
# an owner of type player, and a sign (unicode character)
class Figure
  attr_accessor :position, :owner, :value

  def initialize(position, owner, sign)
    @position = position
    @owner = owner
    @sign = sign
  end
end