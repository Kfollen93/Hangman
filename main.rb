# require_relative files
require_relative 'display.rb'
require_relative 'game.rb'
require_relative 'board.rb'
require_relative 'serializer.rb'

display_game = Display.new
display_game.instructions
game = Game.new
game.setup
game.start
