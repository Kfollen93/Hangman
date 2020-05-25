#require_relative files
require_relative 'display.rb'
require_relative 'game.rb'

display_game = Display.new
display_game.instructions
start = Game.new
start.word(5, 12)