class Game

def dictionary
  File.readlines("5desk.txt", chomp: true) #chomp is an additional parameter added to readlines. Removes the \n.
end

def word(min, max)
  choose_word = dictionary.select{ |word| word.length.between?(min, max) }.sample
  puts choose_word
end

def input_guess
  guess = gets.chomp
  until guess =~ /\A[a-z]{1}\z/ #Regex for guess as a String.
  puts 'Your guess must only be one alphabetic character.'
  guess = gets.chomp
  end
end

def game_over
end

end

start = Game.new
start.word(5, 12)