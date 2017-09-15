require_relative 'square.rb'
require_relative 'figures/rook.rb'
# Dir["/lib/figures/*.rb"].each { |file| require file }

# Represents a chessboard consisting of 64 squares.
# @squares is an array containing all of the squares
class Board
  attr_accessor :squares

  def initialize
    @squares = []
    for i in 0..7
      for j in 0..7
        @squares << Square.new([i, j])
      end
    end
  end

  # Places the figures at their respective spots on the board
  def generate_figures(player)
    generate_rooks(player)
  end

  def generate_rooks(player)
    if player.color == :white
      y = 1
      sign = '♖'
    else
      y = 6
      sign = '♜'
    end

    for i in 0..7 do
      square_with_coordinate([i, y]).figure = Rook.new([i, y], player, sign)
    end

  end

  # Finds the square object in the @squares array that corresponds to the given coordinates
  def square_with_coordinate(coordinates)
    @squares.each {|square| return square if square.coordinates == coordinates}
  end

  private :square_with_coordinate
end