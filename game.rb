class Game

def dictionary
  File.readlines("5desk.txt", chomp: true) #chomp is an additional parameter added to readlines. Removes the \n.
end

def word(min, max)
  choose_word = dictionary.select{ |word| word.length.between?(min, max) }.sample
  #puts choose_word   #don't want to display word, but here for testing
end

def game_over
end

end