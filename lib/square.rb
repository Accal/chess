# Represents individual chessboard squares. Each square has
# coordinates represented as an array of x and y ([x, y]),
# and a figure which occupies the current square. If no figure
# occupies a square it is set to nil by default.
class Square
  attr_accessor :coordinates, :figure

  def initialize(coordinates = nil, figure = nil)
    @coordinates = coordinates
    @figure = figure
  end

end