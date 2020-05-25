#require_relative files
require_relative 'display.rb'
require_relative 'game.rb'
require_relative 'board.rb'

display_game = Display.new
display_game.instructions
start = Game.new
start.word(5, 12)
board = Board.new
board.to_s
board.input_guess