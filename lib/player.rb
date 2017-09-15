Dir["/lib/figures/*.rb"].each { |file| require file }

# Represents a player who owns figures stored in the @figures array
# and a @color (white or black)
class Player
  attr_accessor :color, :figures

  def initialize(color)
    @color = color
    # @figures = generate_figures
  end

  # def generate_figures
  #   #Generates rooks
  #   (0..7).times do
  #     @figures << Rook.new()
  #   end
  # end
end