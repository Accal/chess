require_relative 'board'
require_relative 'player'

# A class containing all of the methods relevant to running the game
class Game
  attr_accessor :board, :player1, :player2

  def initialize
    @board = Board.new
    @player1 = Player(:black)
    @player2 = Player(:white)
  end
end