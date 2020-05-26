# require_relative files
require_relative 'display.rb'
require_relative 'game.rb'
require_relative 'board.rb'

display_game = Display.new
display_game.instructions
game = Game.new
game.setup
game.choose_word
game.start
board = Board.new
board.map_blanks
board.input_guess
