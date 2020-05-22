#require_relative files


#start = Game.new (so Game class/file should have initialize method?)

 
#GAME.RB FILE


class Game

 def load_script
  dictionary = File.open('5desk.txt', 'r')
   dictionary.readlines.each do |word|
    choose_word = word.gsub(/\s+/, '')
    if choose_word.length.between?(5, 12)
      puts Random.rand(choose_word)
    end
   end
 end
end

start = Game.new
start.load_script