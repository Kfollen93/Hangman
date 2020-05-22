#require_relative files


#start = Game.new (so Game class/file should have initialize method?)

 
#GAME.RB FILE


class Game

def load_script
@dictionary = File.open('5desk.txt', 'r')
  @dictionary.readlines.each do |word|
  @@choose_word = word.gsub(/\s+/, '')
    if @@choose_word.length.between?(5, 12)
      @@choose_word
    end
  end
end

def random_word
  @word_array = @@choose_word.split("\n")
  puts @word_array.sample #how do I get just one random word to return
end

end

start = Game.new
start.load_script
start.random_word
