class Game

def dictionary
  File.readlines("5desk.txt", chomp: true) #chomp is an additional parameter added to readlines. Removes the \n.
end

def word(min, max)
  $choose_word = dictionary.select{ |word| word.length.between?(min, max) }.sample
  $chosen_word = $choose_word.downcase
  puts $chosen_word #Just for testing.
  $chosen_word.chars #This is an ARRAY broken by each char.
end

def game_over
  if $slots.none? { |str| str == '_'}
    puts "Good job, you won!"
  end
end

end