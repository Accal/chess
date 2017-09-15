require_relative 'board.rb'
require_relative 'player.rb'

board = Board.new
player = Player.new(:white)
board.generate_figures(player)
puts 'lol'