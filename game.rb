class Game

def words
  dictionary = File.open('5desk.txt', 'r')

  dictionary.readlines.each do |word|
    choose_word = word.gsub(/\s+/, '')
    if choose_word.length.between?(5, 12)
      choose_word.split("\n")
    end
  end
end

def random_word
  puts words.sample #This returns words below 5 and over 12 chars, need to fix.
end

end

start = Game.new
start.random_word