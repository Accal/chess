require_relative 'board'
require_relative 'player'

# A class containing all of the methods relevant to running the game
class Game
  attr_accessor :board, :player1, :player2, :current_player

  def initialize
    @board = Board.new
    @player1 = Player.new(:white)
    @player2 = Player.new(:black)
    @current_player = @player1

    board.generate_figures(player1)
    board.generate_figures(player2)
  end

  # Allows the pieces to move positions by invoking the same method
  # in the Board class. Two arrays are taken as an argument,
  # first being the current position, and the second being
  # the final square.
  def move(current_position, desired_square)
    board.move(current_position, desired_square, current_player)
  end
end