class Game

def words
  File.readlines("5desk.txt", chomp: true)
end

def word(min, max)
  min = 5
  max = 12
  choose_word = words.select{ |word| word.length.between?(min, max) }.sample
  puts choose_word
end

end

start = Game.new
start.word(5, 12)