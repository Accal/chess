# Represents a player who owns pieces stored in the @pieces array
# and a @color (:white or :black)
class Player
  attr_accessor :color, :figures

  def initialize(color)
    @color = color
    # @pieces = generate_figures
  end
end