require 'require_all'
require_all 'lib/pieces'
require_relative 'square.rb'

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

  # Places the pieces at their respective spots on the board
  def generate_figures(player)
    generate_pawns(player)
    generate_rooks(player)
    generate_bishops(player)
    generate_knights(player)
    generate_kings(player)
    generate_queens(player)
  end

  def generate_pawns(player)
    if player.color == :white
      y = 1
      sign = '♙'
    else
      y = 6
      sign = '♟'
    end

    for x in 0..7 do
      square_with_coordinate([x, y]).figure = Pawn.new([x, y], player, sign)
    end
  end

  def generate_rooks(player)
    if player.color == :white
      y = 0
      sign = '♖'
    else
      y = 7
      sign = '♜'
    end

    [0, 7].each do |x|
      square_with_coordinate([x, y]).figure = Rook.new([x, y], player, sign)
    end
  end

  def generate_knights(player)
    if player.color == :white
      y = 0
      sign = '♘'
    else
      y = 7
      sign = '♞'
    end

    [1, 6].each do |x|
      square_with_coordinate([x, y]).figure = Knight.new([x, y], player, sign)
    end
  end

  def generate_bishops(player)
    if player.color == :white
      y = 0
      sign = '♗'
    else
      y = 7
      sign = '♝'
    end

    [2, 5].each do |x|
      square_with_coordinate([x, y]).figure = Bishop.new([x, y], player, sign)
    end
  end

  def generate_kings(player)
    if player.color == :white
      y = 0
      sign = '♔'
    else
      y = 7
      sign = '♚'
    end

    square_with_coordinate([4, y]).figure = King.new([4, y], player, sign)
  end

  def generate_queens(player)
    if player.color == :white
      y = 0
      sign = '♕'
    else
      y = 7
      sign = '♛'
    end

    square_with_coordinate([3, y]).figure = Queen.new([3, y], player, sign)
  end

  # Moves the figure from the current square to goal square.
  # The method first checks whether the figure on the current square's
  # owner is the current player. Then, it checks whether the desired
  # move is valid through the valid_move? method. If both checks pass
  # the figure on the goal square is replaced by the figure on the current
  # square and the figure on the current square is changed to nil.
  def move(current, goal, current_player)
    return unless valid_move?(current, goal, current_player)

    square_with_coordinate(goal).figure = square_with_coordinate(current).figure
    square_with_coordinate(current).figure = nil
  end

  # Finds the square object in the @squares array that corresponds to the given coordinates
  def square_with_coordinate(coordinates)
    @squares.each { |square| return square if square.coordinates == coordinates }
  end

  # Returns true if the desired move is legal. To be considered legal
  # the figure must be able to move to the desired square, the current player
  # must be the owner of the figure on the current square, and
  # the desired square must NOT be populated by the same owner
  # as the figure on the current square.
  def valid_move?(current, goal, current_player)
    if figure_on_square(current).nil?
      puts 'That move is not legal'
      false
    elsif figure_on_square(current).owner != current_player
      puts 'You are not the owner of that figure'
      false
    elsif figure_on_square(current).can_move?(goal) && figure_on_square(goal).nil?
      true
    elsif figure_on_square(current).can_move?(goal) && figure_on_square(current).owner != figure_on_square(goal).owner
      true
    else
      puts 'That move is not legal'
      false
    end
  end

  # A helper method that returns the figure object on the desired square
  def figure_on_square(square)
    square_with_coordinate(square).figure
  end

  private :square_with_coordinate, :generate_rooks, :generate_pawns, :generate_queens, :generate_kings
  private :generate_bishops, :generate_knights, :valid_move?, :square_with_coordinate, :figure_on_square
end